# XDG
set -x XDG_CACHE_HOME "$HOME/var/cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/usr/share"
set -x XDG_DESKTOP_DIR "$HOME/usr/dsk"
set -x XDG_DOWNLOAD_DIR "$HOME/tmp"
set -x XDG_DOCUMENTS_DIR "$HOME/usr/doc"
set -x XDG_MUSIC_DIR "$HOME/usr/msc"
set -x XDG_PICTURES_DIR "$HOME/usr/img"
set -x XDG_VIDEOS_DIR "$HOME/usr/vid"

# Directories
set -x GHQ_ROOT "$HOME/src"
set -x GOPATH "$HOME/go"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x GNUPGHOME "$XDG_CONFIG_HOME/gpg"

# GPG
set -x GPG_TTY (tty)

# Default programs
set -x BROWSER "firefox"
set -x EDITOR "nvim"
set -x MANPAGER "nvim -c 'set ft=man' -"
set -x SHELL "/usr/local/bin/fish"
# set -x IMGVIEW "sxiv -b"
# set -x VIDPLAY "mpv"

# Misc settings
set -x BUILDDIR "/tmp/makepkg"
set -x LESS "-F -g -i -M -R -S -w -X -z-4"
set -x MPD_HOST "localhost"

# Npm
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -x NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -x NODE_ENV "development"
set -x NPM_DIR "$XDG_DATA_HOME/.config/nvm/11.9.0/bin" 

# Tmux
set -x TMUX_HOME "$XDG_CONFIG_HOME/tmux"
set -x TMUX_PLUGIN_MANAGER_PATH "$TMUX_HOME/plugins"

# FZF
set -x FZF_DEFAULT_COMMAND "sh -c 'git ls-tree -r --name-only HEAD 2> /dev/null || fd -H --type f --ignore-file $XDG_CONFIG_HOME/git/ignore . $HOME'"
set -x FZF_DEFAULT_OPTIONS "--cycle --color=16,fg+:2,bg+:0,hl:4,hl+:4,prompt:4,pointer:8 --border"

# Skim
set -x SKIM_DEFAULT_COMMAND "sh -c 'git ls-tree -r --name-only HEAD 2> /dev/null || fd -H --type f --ignore-file $XDG_CONFIG_HOME/git/ignore . $HOME'"
set -x SKIM_DEFAULT_OPTIONS "--cycle --color=16,fg+:2,bg+:0,hl:4,hl+:4,prompt:4,pointer:8 --border"

# Faster compilation
set -x CFLAGS "-march=znver1"
set -x CXXFLAGS "$CFLAGS"

# Path
set -U fish_user_paths "/usr/local/bin" "/usr/bin" "/bin" "/usr/local/sbin" "/usr/sbin" "/sbin" "/usr/local/opt/coreutils/libexec/gnubin" "$HOME/.emacs.d/bin" "$NPM_DIR" "$CARGO_HOME/bin"