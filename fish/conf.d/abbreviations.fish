# General
abbr "s" "sudo"
abbr "c" "clear"
abbr "y" "pbcopy"
abbr "p" "pbpaste"

abbr "chmox" "chmod +x"
abbr "scu" "systemctl --user"
abbr "sc" "sudo systemctl"

abbr "mkd" "mkdir -pv"
abbr "bi" "brew install"

abbr "yt" "youtube-dl --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
abbr "yta" "yt -x -f bestaudio/best"

# Editor
abbr "v" "nvim"
abbr "e" "$EDITOR -n"
# abbr "ec" "$EDITOR -nc"
# abbr "et" "$EDITOR -nw"

# Navigation
abbr "..." "cd ../.."
abbr "...." "cd ../../.."
abbr "....." "cd ../../../.."

alias "ls" "lsd"
abbr "l" "ls -l"
abbr "la" "ls -aF"
abbr "ll" "ls -alF"
abbr "lt" "ls --tree"

# Projects
abbr "proj" "cd ~/projects/"
abbr "popf" "cd ~/projects/apple/population-frontend/population"
abbr "popb" "cd ~/projects/apple/population-backend/population"
abbr "popr" "cd ~/projects/apple/resources/population"

# Shortcuts
abbr "dl" "cd ~/Downloads"
abbr "dwl" 'cd $XDG_DOWNLOAD_DIR/dwl' # single quotes preserves string
abbr "dfl" 'cd $DOTFILES' # so that the variable is evaluated on exec
abbr "emc" 'cd ~/.emacs.d'

abbr "h" "history"
abbr "jo" "jobs"
abbr "k" "pkill"

# Services
abbr "bstart" "brew services start"
abbr "bstop" "brew services stop"

abbr "bsrcs" "brew services restart chunkwm; brew services restart skhd;"
abbr "bsrc" "brew services restart chunkwm"
abbr "bssc" "brew services stop chunkwm"
abbr "bsrs" "brew services restart skhd"
abbr "bsss" "brew services stop skhd"

# Spotify
abbr "sp" "spotify"

# Git
abbr "g" "git"

# tmux
alias "tmux" "env TERM=xterm-256color-it tmux -2 -f ~/.config/tmux/tmux.conf"
abbr "tinit" 'source $DOTFILES/tmux/scripts/tmux.fish'
abbr "tls" "tmux ls"
abbr "tnew" "tmux new -s"
abbr "tkill" "tmux kill-session -t"
abbr "tat" "tmux attach -t"
abbr "tatt" "new-tmux-from-dir-name"
abbr "td" "tmux detach"

# npm
abbr "ni" "npm install"
abbr "nis" "npm install --save"
abbr "nid" "npm install --save-dev"
abbr "nig" "npm install --global"
abbr "nu" "npm uninstall"
abbr "nus" "npm uninstall --save"
abbr "nud" "npm uninstall --save-dev"
abbr "nug" "npm uninstall --global"

# python
abbr "pap" "pyenv activate pop"
abbr "pr" "poetry run"
abbr "prm" "poetry run ./manage.py"

# terraform
abbr "tf" "terraform"
abbr "tfa" "terraform apply"
abbr "tfaa" "terraform apply -auto-approve"
abbr "tfd" "terraform destroy"
abbr "tfda" "terraform destroy -auto-approve"
