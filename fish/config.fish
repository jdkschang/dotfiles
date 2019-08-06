#!/usr/bin/env fish
set -g -x LC_ALL en_US.UTF-8
set -g -x LC_LANG en_US.UTF-8
set -g -x LANG en_US.UTF-8

# Set hybrid keybindings (Emacs + Vim)
# set -U fish_key_bindings fish_hybrid_key_bindings
set -U fish_key_bindings fish_vi_key_bindings

# Switch between normal and insert mode with no delay
set -U cmd_duration 0

# Colorize the following commands
set -U grc_plugin_execs cat cvs df diff dig gcc g++ ip make mount mtr netstat ping ps tail traceroute wdiff

# Disable greeting
# set -U fish_greeting

# FZF
# Enable fzf tab completion
set -U FZF_COMPLETE 2
# Enable preview window open command
set -U FZF_ENABLE_OPEN_PREVIEW 1

# set -U FZF_DEFAULT_COMMAND 'command ag -g --hidden --ignore ~/.config/git/ignore \$dir'
# set -U FZF_DEFAULT_OPTS '--multi --inline-info --height=40% --min-height=15 --reverse'
# set -x FZF_DEFAULT_COMMAND "sh -c 'git ls-tree -r --name-only HEAD 2> /dev/null || fd -H --type f --ignore-file $XDG_CONFIG_HOME/git/ignore . $HOME'"
# set -x FZF_DEFAULT_OPTIONS "--cycle --color=16,fg+:2,bg+:0,hl:4,hl+:4,prompt:4,pointer:8 --border"

# set -x FZF_FIND_FILE_COMMAND 'command ag -l --hidden --ignore ~/.config/git/ignore \$dir'
# set -x FZF_FIND_FILE_OPTS "--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# set -U FZF_CD_COMMAND 'command ag -l --hidden \$dir'
