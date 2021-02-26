#!/usr/bin/env fish

# simple script to shutdown the running Emacs daemon

# emacsclient options for reference
# -a Alternate editor, runs bin/false in this case
# -e eval the script

# If the server-process is bound and the server is in a good state, then kill
# the server

function server_ok
    emacsclient -a "false" -e "(boundp 'server-process)"
end

function es
    if [ "t" = (server_ok) ]
        echo "Shutting down Emacs server"
        # wasn't removing emacs from ALT-TAB on mac
        # emacsclient -e "(server-force-delete)"
        emacsclient -e '(kill-emacs)'
    else
        echo "Emacs server not running"
    end
end
