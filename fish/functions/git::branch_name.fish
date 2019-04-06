#!/usr/bin/env fish

function git::branch_name
		git::is_repo; and begin
				command git symbolic-ref --short HEAD ^/dev/null;
				or command git show-ref --head -s --abbrev | head -n1 ^/dev/null
		end
end
