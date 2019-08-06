#!/usr/bin/env fish

function bcp -d 'Remove brew plugins'
		set -l inst (brew leaves | eval "fzf $FZF_DEFAULT_OPTS -m --header='[brew:uninstall]'")

		if not test (count $inst) = 0
				for prog in $inst
						brew uninstall '$prog'
				end
		end
end
