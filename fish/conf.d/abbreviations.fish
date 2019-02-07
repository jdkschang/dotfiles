# General
abbr "s" "sudo"
abbr "c" "clear"
abbr "y" "pbcopy"
abbr "p" "pbpaste"

abbr "chmox" "chmod +x"
abbr "scu" "systemctl --user"
abbr "sc" "sudo systemctl"

# Editor
abbr "v" "nvim"
abbr "e" "emacs -nw"
abbr "ec" "~/bin/emacsclient -c"

# Navigation
abbr "..." "cd ../.."
abbr "...." "cd ../../.."
abbr "....." "cd ../../../.."
abbr "l" "la"
abbr "ll" "ll -a"

# Projects
abbr "proj" "cd $IKIGAI"
abbr "projgc" "cd ~/Projects"
abbr "emc" "cd ~/.emacs.d"
abbr "doom" "cd $IKIGAI/doom"
abbr "rwa" " cd $IKIGAI/react-web-app"

# Shortcuts
abbr "dl" "cd ~/Downloads"
abbr "dwl" 'cd $XDG_DOWNLOAD_DIR/dwl' # single quotes preserves string
abbr "dfl" 'cd $DOTFILES'             # so that the variable is evaluated on exec

abbr "h" "history"
abbr "jo" "jobs"

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

# misc
alias "cat" "bat"
