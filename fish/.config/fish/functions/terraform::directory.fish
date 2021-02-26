function terraform::directory
	command find . -name '*.tf' >/dev/null ^/dev/null -maxdepth 0
end
