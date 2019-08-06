#!/usr/bin/env fish

function git::is_dirty
		git::is_repo; and not command git diff --no-ext-diff --quiet --exit-code
end
