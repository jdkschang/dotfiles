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
abbr "v" "$EDITOR"
abbr "e" "$EDITOR"
abbr "ec" "$EDITOR -c"
abbr "et" "$EDITOR -w"

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
abbr "proj" "cd ~/org/projects/"
abbr "projgc" "cd ~/Projects/"
abbr "rwa" " cd ~/org/projects/react-web-app"

# Shortcuts
abbr "dl" "cd ~/Downloads"
abbr "dwl" 'cd $XDG_DOWNLOAD_DIR/dwl' # single quotes preserves string
abbr "dfl" 'cd $DOTFILES'             # so that the variable is evaluated on exec
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

# Git
abbr "g" "git"

# tmux
alias "tmux" "env TERM=xterm-256color-it tmux -2 -f ~/.config/tmux/tmux.conf"
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
