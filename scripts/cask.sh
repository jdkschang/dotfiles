brew tap caskroom/cask
brew tap caskroom/versions

# Browsers
brew cask install firefox
brew cask install google-chrome-beta

# Cloud
brew cask install cloud
brew cask install dropbox

# Comms
brew cask install google-hangouts
brew cask install skype

# Media
brew cask install spotify
brew cask install imageoptim
brew cask install iina

# Development
brew cask install java
brew cask install iterm2-nightly
brew cask install visual-studio-code

# Mac OS Enhancements
brew cask install alfred
brew cask install bartender
brew cask install keepingyouawake

# Other stuff
brew cask install deluge

# Fonts
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts
brew cask install caskroom/fonts/font-hack
brew cask install caskroom/fonts/font-hack-nerd-font

brew cask cleanup
