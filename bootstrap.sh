#! /usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR" || exit

HOMEBREW_BUNDLE_FILE="$DIR/macos/Brewfile"
export HOMEBREW_BUNDLE_FILE

chmod u+x macos/scripts/*

. "$DIR/macos/scripts/utils.sh"

macos-bootstrap()   {
	info "Starting macOS setup..."

	info "Installing XCode command line tools..."
	if xcode-select --print-path &> /dev/null; then
		success "XCode command line tools already installed."
	elif xcode-select --install &> /dev/null; then
		success "Finished installing XCode command line tools."
	else
		error "Failed to install XCode command line tools."
	fi

	info "Setting better defaults for macOS..."
	if source "$DIR/macos/scripts/macos-defaults.sh"; then
		success "Finished installing macOS better defaults."
	else
		error "Failed to install macOS better defaults."
	fi

	success "Finished bootstrapping macOS..."
}
setup-brew()   {
	info "Installing Homebrew package manager..."
	if brew info; then
		success "Homebrew is already installed."
	elif /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
		success "Finished installing Homebrew package manager."
	else
		error "Failed to install Homebrew package manager."
	fi

	info "Installing Homebrew Brewfile packages..."
	brew bundle install
	success "Finished installing Brewfile packages."
}
setup-fish() {
	if command -v fish > /dev/null 2>&1; then
		info "Installing fisher..."
		curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
		info "Installing plugins..."
		fisher update

		read -rp "Do you wish to fish? (y/n)" yn
		case $yn in
			[Yy]*) chsh -s /usr/local/bin/fish ;;
			[Nn]*) echo "Keeping default shell..." ;;
		esac
	else
		echo "Please install fish-shell"
	fi
}
setup-emacs()  {
	if command -v emacs > /dev/null 2>&1; then
		cd "$HOME/.emacs.d" || exit

	else
		echo "Please install emacs"
	fi
}
setup-nvim()   {
	info "Starting nvim setup..."
	if command -v nvim > /dev/null 2>&1; then
		cd "$DIR/nvim/.config/nvim" || exit

		if command -v pip3 > /dev/null 2>&1; then
			echo "Installing junegunn/vim-plug..."
			sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
				   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		else
			echo "Please install python 3"
		fi

		cd "$DIR" || exit
	else
		echo "Please install neovim"
	fi
	success "Finished nvim setup"
}

info "Prompting for sudo password..."
if sudo -v; then
	# keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2> /dev/null &
	success "Sudo credentials updated."
else
	error "Failed to obtain sudo credentials."
fi

read -rp "Begin bootstrap macOS process for better defaults? (y/n)" yn
case $yn in
	[Yy]*) macos-bootstrap ;;
	[Nn]*) echo "Skipping macOS bootstrap setup..." ;;
esac

read -rp "Install brew packages? (y/n)" yn
case $yn in
	[Yy]*) setup-brew ;;
	[Nn]*) echo "Skipping brew bundle package installation..." ;;
esac

info "Setting Node version"
fnm use 12
success "Switched to Node v12"

info "Starting configuration symlinks with GNU Stow..."
if command -v stow > /dev/null 2>&1; then
	stow -t ~/ ack ctags curl doom editorconfig fish git htop iterm karabiner nvim ssh tmux vscode wget
else
	error "Please install GNU Stow to start the config symlink process"
fi
success "Finished symlink configuration"

read -rp "Do you wish to setup neovim (y/n)" yn
case $yn in
	[Yy]*) setup-nvim ;;
	[Nn]*) echo "Skipping neovim setup..." ;;
esac

#read -rp "Do you wish to setup emacs (y/n)" yn
#case $yn in
#	[Yy]*) setup-emacs ;;
#	[Nn]*) echo "Skipping emacs setup..." ;;
#esac

read -rp "Do you wish to setup fish-shell (y/n)" yn
case $yn in
	[Yy]*) setup-fish ;;
	[Nn]*) echo "Skipping fish setup..." ;;
esac

success "Finished installing dotfiles!"
