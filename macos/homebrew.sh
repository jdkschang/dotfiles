# Check for homebrew and install if needed
echo "Installing homebrew ..."

which -s brew
if [[ $? != 0 ]] ; then
    yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed ..."
fi

brew update

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
ln -sv /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Replace system curl
brew install curl --with-openssl
brew link curl --force

# less highlighting
brew install source-highlight

# Install `wget` with IRI support.
brew install wget --with-iri

# emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-no-titlebar

# neovim
brew install python3
brew install neovim/neovim/neovim
pip3 install neovim

# fzf
brew install fzf
yes | /usr/local/opt/fzf/install

# Ag - fzf is configured to use this
brew install the_silver_searcher

# tmux
brew install reattach-to-user-namespace
brew install tmux
brew install urlview

# git
brew install git

# Install more recent versions of some OS X tools.
brew tap homebrew/dupes
brew install grep --with-default-names

# Install other useful binaries.
brew install ack
brew install ctags
brew install direnv
brew install go
brew install exa
brew install lsd
brew install htop
brew install httpie
brew install p7zip
brew install python
brew install neofetch
brew install bat # super cat
brew install gnupg # secure sign
brew install ncdu # prettier du (diskutil)
brew install shpotify # cli spotify
brew install tldr # dummy for descriptions
brew install tree
brew install yarn
brew install youtube-dl

# Cloud
brew install --cask dropbox

# Media
brew install --cask spotify

# Browser
brew install --cask brave-browser

# Window Management
brew install --cask moom

# Development
brew install openjdk
brew install --cask visual-studio-code

# Mac OS Enhancements
brew install --cask alfred
brew install --cask bartender

brew cleanup
