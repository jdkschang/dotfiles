#!/usr/bin/env fish

function git::is_touched
		git::is_repo; and begin
				test -n (echo (command git status --porcelain))
		end
end
