#!/usr/local/bin/fish

set SESSIONS base

function session_base
    tmux new-session -d -s base
    tmux neww -k -n config -t base:1
    tmux send-keys 'dfl' C-m
    tmux send-keys 'git status' C-m
    tmux split-window -h
    tmux send-keys 'cd ~/.emacs.d' C-m
    tmux send-keys 'doom sync && doom build' C-m

    tmux neww -k -n pop-front -t base:2
    tmux send-keys 'popf' C-m
    tmux send-keys 'git status' C-m
    tmux split-window -h
    tmux send-keys 'popf' C-m
    tmux send-keys 'npm start' C-m

    tmux neww -k -n pop-back -t base:3
    tmux send-keys 'popb' C-m
    tmux send-keys 'git status' C-m
    tmux split-window -h
    tmux send-keys 'popb' C-m
    tmux send-keys 'docker-compose up' C-m
    tmux split-window -v
    tmux send-keys 'popb' C-m
    tmux send-keys 'pap' C-m
    tmux send-keys './manage.py runserver' C-m

    sshadd
end

function has_session -d 'check if session exists'
    echo 'check if session exists: ' $argv[1]
    tmux has-session $argv[1] ^/dev/null
end

function except -d 'if has session errored then run session init script'
    if [ $status -eq 1 ]
        $argv[1]
    end
end

function sshadd -d 'add ssh config'
    echo 'add ssh profiles'
    ssh-add -K ~/.ssh/apple
    ssh-add -K ~/.ssh/github-personal
end

#MAIN
for x in $SESSIONS
    echo $x
    has_session $x
    except session_$x
    tmux attach -t $x
end
