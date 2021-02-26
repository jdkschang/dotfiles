#!/usr/bin/env fish


function __fetch_pop_front_latest_commit_hash -d 'Fetch Population Frontend latest commit hash'
    cd ~/projects/apple/population-frontend/population
    git checkout $argv[1]

    set -gx "POPFRONT_$argv[1]" (git rev-parse @)
end
