#! /bin/sh

DIR=$(dirname "$0")
cd "$DIR"

. ~/projects/jdkschang/dotfiles/scripts/functions.sh

info "Prompting for sudo password..."
if sudo -v; then
    # keep-alive: update exisiting `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

info "Installing XCode command line tools..."
if xcode-select --print-path &>/dev/null; then
    success "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    success "Finished installing XCode command line tools."
else
    error "Failed to install XCode command line tools."
fi

info "Installing Homebrew package manager..."
if brew info &>/dev/null; then
    success "Homebrew is already installed."
elif /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null; then
    success "Finished installing Homebrew package manager."
else
    error "Failed to install Homebrew package manager."
fi

# instantiate package control
. packages/setup.sh

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

sucess "Finished installing dotfiles!"
