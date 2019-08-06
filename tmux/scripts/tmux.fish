#!/usr/local/bin/fish

set SESSIONS base

# function session_gc
#   tmux new-session -d -s gc
#   tmux neww -k -n geesee -t gc:1
#   tmux send-keys 'rwa' C-m
#   tmux split-window -h
#   tmux send-keys 'rwa' C-m
#   tmux send-keys 'yarn' C-m
#   tmux send-keys 'yarn start' C-m
#   tmux split-window -v
#   tmux send-keys 'rwa' C-m
# end

function session_base
  tmux new-session -d -s base
  tmux neww -k -n config -t base:1
  tmux send-keys 'dfl' C-m
  tmux split-window -h
  tmux send-keys 'cd ~/.emacs.d' C-m
  tmux neww -k -n main -t base:2
  tmux send-keys 'proj' C-m
  tmux split-window -h
  tmux send-keys 'proj' C-m
  tmux split-window -v
  tmux send-keys 'proj' C-m
end

function has_session -d 'check if session exists'
  tmux has -t $argv[1] ^ /dev/null
end

function except -d 'if has session errored then run session init script'
  if [ $status -eq 1 ]
    $argv[1]
  end
end

#MAIN
for x in $SESSIONS
  echo $x
  has_session $x
  except session_$x
end
