# XDG
set -gx XDG_CACHE_HOME "$HOME/var/cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/usr/share"

set -gx XDG_DESKTOP_DIR "$HOME/usr/dsk"
set -gx XDG_DOWNLOAD_DIR "$HOME/tmp"
set -gx XDG_DOCUMENTS_DIR "$HOME/usr/doc"
set -gx XDG_MUSIC_DIR "$HOME/usr/msc"
set -gx XDG_PICTURES_DIR "$HOME/usr/img"
set -gx XDG_VIDEOS_DIR "$HOME/usr/vid"

# Directories
set -x GHQ_ROOT "$HOME/src"
set -gx GOPATH "$HOME/go"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx GNUPGHOME "$XDG_CONFIG_HOME/gpg"

set -gx IKIGAI "$HOME/org/projects"
set -gx DOTFILES "$IKIGAI/dotfiles"

# GPG
set -x GPG_TTY (tty)

# Default programs
set -gx BROWSER "firefox"
set -gx EDITOR "emacsclient -n"
set -gx MANPAGER "nvim -c 'set ft=man' -"
set -gx SHELL "/usr/local/bin/fish"
set -gx ALTERNATE_EDITOR "" # necessary for emacsclient
# set -x IMGVIEW "sxiv -b"
# set -x VIDPLAY "mpv"

# Misc settings
set -x BUILDDIR "/tmp/makepkg"
set -x LESS "-F -g -i -M -R -S -w -X -z-4"
set -x MPD_HOST "localhost"

# Npm
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -gx NODE_ENV "development"
set -gx NPM_DIR "$XDG_CONFIG_HOME/nvm/11.9.0/bin"

# Tmux
set -gx TMUX_HOME "$XDG_CONFIG_HOME/tmux"
set -gx TMUX_PLUGIN_MANAGER_PATH "$TMUX_HOME/plugins"

# FZF
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g'
set -gx FZF_DEFAULT_OPTS "--multi --inline-info --height=40% --min-height=15 --reverse"
# set -x FZF_DEFAULT_COMMAND "sh -c 'git ls-tree -r --name-only HEAD 2> /dev/null || fd -H --type f --ignore-file $XDG_CONFIG_HOME/git/ignore . $HOME'"
# set -x FZF_DEFAULT_OPTIONS "--cycle --color=16,fg+:2,bg+:0,hl:4,hl+:4,prompt:4,pointer:8 --border"


# Skim
set -x SKIM_DEFAULT_COMMAND "sh -c 'git ls-tree -r --name-only HEAD 2> /dev/null || fd -H --type f --ignore-file $XDG_CONFIG_HOME/git/ignore . $HOME'"
set -x SKIM_DEFAULT_OPTIONS "--cycle --color=16,fg+:2,bg+:0,hl:4,hl+:4,prompt:4,pointer:8 --border"

# Faster compilation
set -x CFLAGS "-march=znver1"
set -x CXXFLAGS "$CFLAGS"
set -x LDFLAGS "-L/usr/local/opt/llvm/lib"
set -x CPPFLAGS "-I/usr/local/opt/llvm/include"

# Path
set -U fish_user_paths "$HOME/bin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/local/sbin" "/usr/sbin" "/sbin" "/usr/local/opt/coreutils/libexec/gnubin" "$HOME/.emacs.d/bin" "$NPM_DIR" "$CARGO_HOME/bin"
