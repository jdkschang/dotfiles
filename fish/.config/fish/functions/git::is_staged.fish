#!/usr/bin/env fish

function git::is_staged
		git::is_repo; and begin
				not command git diff --cached --no-ext-diff --quiet --exit-code
		end
end
