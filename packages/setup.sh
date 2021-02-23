#! /usr/bin/env sh


DIR=$(dirname "$0")
cd "$DIR"

COMMENT=\#*

. $DIR/scripts/functions.sh

sudo -v

info "Installing Brewfile packages..."
brew bundle install
success "Finished installing Brewfile packages."

fnm use 11
success "Switched to Node v11"

# find * -name "*.list" | while read fn; do
#     cmd="${fn%.*}"
#     set -- $cmd
#     info "Installing $1 packages..."
#     while read package; do
#         if [[ $package == $COMMENT ]];
#         then continue
#         fi
#         substep_info "Installing $package..."
#         $cmd $package
#     done < "$fn"
#     success "Finished installing $1 packages."
# done
