#!/bin/sh
tmux new-session -d -s base -n config
  tmux send-keys 'df' C-m
  tmux split-window -h

tmux new-window -n main
  tmux send-keys 'proj' C-m
  tmux split-window -h
  tmux send-keys 'proj' C-m
  tmux split-window -v
  tmux send-keys 'proj' C-m

tmux new-session -d -s gc -n geesee
  tmux send-keys 'rwa' C-m
  tmux split-window -h
  tmux send-keys 'rwa' C-m
  tmux send-keys 'y start' C-m
  tmux split-window -v
  tmux send-keys 'rwa' C-m
