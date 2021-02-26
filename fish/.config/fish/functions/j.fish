function j -d "Jump to a recent directory."
		[ $# -gt 0 ] && _z "$*" && return
		cd '(__z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query '${*##-* }" | sed 's/^[0-9,.]* *//')"
end
