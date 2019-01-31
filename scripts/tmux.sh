#!/bin/sh

SESSIONS="base gc"

# Configure your sessions here
session_gc ()
{
  tmux new-session -d -s gc
  tmux neww -k -n geesee -t gc:1
  tmux send-keys 'rwa' C-m
  tmux split-window -h
  tmux send-keys 'rwa' C-m
  tmux send-keys 'yarn' C-m
  tmux send-keys 'yarn start' C-m
  tmux split-window -v
  tmux send-keys 'rwa' C-m
}

session_base ()
{
  tmux new-session -d -s base
  tmux neww -k -n config -t base:1
  tmux send-keys 'dfs' C-m
  tmux split-window -h
  tmux send-keys 'cd ~/.emacs.d'
  tmux neww -k -n main -t base:2
  tmux send-keys 'proj' C-m
  tmux split-window -h
  tmux send-keys 'proj' C-m
  tmux split-window -v
  tmux send-keys 'proj' C-m
}

has_session () {
  tmux has -t $1 2>/dev/null
}

except () {
  if [ "$?" -eq 1 ] ; then
    $1
  fi
}

#MAIN
for x in $SESSIONS
do
  echo "$x"
  has_session $x
  except session_$x
done
