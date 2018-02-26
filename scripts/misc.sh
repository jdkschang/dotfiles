# Install fzf
echo "Setting up fzf ..."
yes | /usr/local/opt/fzf/install

# Install blsd
# http://theinfiniteset.net/content/2016/08/combining-tools-blsd-and-fzf/
brew install --HEAD https://raw.githubusercontent.com/junegunn/blsd/master/blsd.rb

# Install Rust and Cargo (used for Alacritty)
curl -sSf https://static.rust-lang.org/rustup.sh | sh
