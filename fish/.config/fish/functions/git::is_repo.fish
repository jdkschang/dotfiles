#!/usr/bin/env fish

function git::is_repo
		test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
end
