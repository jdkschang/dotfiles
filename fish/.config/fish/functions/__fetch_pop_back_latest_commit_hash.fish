#!/usr/bin/env fish

function __fetch_pop_back_latest_commit_hash -d 'Fetch Population Backend latest commit hash'
    cd ~/projects/apple/population-backend/population
    git checkout $argv[1]

    set -gx "POPBACK_$argv[1]" (git rev-parse @)
end
