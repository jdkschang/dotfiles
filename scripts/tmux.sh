tmux new-session -d -s config
tmux send-keys 'df' 'C-m'
tmux rename-window 'config'
tmux select-window -t config:1
tmux split-window -v
tmux send-keys ''

