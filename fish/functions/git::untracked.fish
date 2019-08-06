#!/usr/bin/env fish

function git::untracked
		git::is_repo; and begin
				command git ls-files --other --exclude-standard
		end
end
