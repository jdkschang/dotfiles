#!/usr/bin/env fish

function git::is_stashed
		git::is_repo; and begin
				command git rev-parse --verify --quiet refs/stash >/dev/null
		end
end
