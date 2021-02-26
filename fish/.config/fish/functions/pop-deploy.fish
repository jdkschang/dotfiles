#!/usr/bin/env fish

function pop-deploy -d 'Update & Deploy latest Population image'
    # extract latest commit hash for both frontend & backend repos
    echo "Starting Population deployment for branch: $argv[1]"

    __fetch_pop_front_latest_commit_hash $argv[1]
    __fetch_pop_back_latest_commit_hash $argv[1]

    if [ "$argv[1]" = 'dev' ]
        set FRONT_HASH $POPFRONT_dev
        set BACK_HASH $POPBACK_dev
    else if [ "$argv[1]" = 'main' ]
        set FRONT_HASH $POPFRONT_main
        set BACK_HASH $POPBACK_main
    end

    # # update frontend kube image with frontend hash
    echo "updating frontend image $FRONT_HASH"
    kubectl -n population set image deployment/population-frontend population-frontend=docker.apple.com/vedi/population/population-frontend:$FRONT_HASH
    # # update backend kube image with backend hash
    echo "updating backend image $BACK_HASH"
    kubectl -n population set image deployment/population-backend population-backend=docker.apple.com/vedi/population/population:$BACK_HASH
    # # update cronjob daily & hourly kube image with backend image
    echo "updating cronjob images"
    kubectl -n population set image cronjob/population-popbot-daily population-popbot-daily=docker.apple.com/vedi/population/population:$BACK_HASH
    kubectl -n population set image cronjob/population-popbot-hourly population-popbot-hourly=docker.apple.com/vedi/population/population:$BACK_HASH

    echo "completed update of kubernetes images"

    echo "pulling frontend & backend deployment config: "
    kubectl -n population get deployments population-frontend -o yaml | rg 'image: docker'
    kubectl -n population get deployments population-backend -o yaml | rg 'image: docker'
    echo "pulling cronjobs population-popbot-daily & hourly config: "
    kubectl -n population get cronjobs population-popbot-daily -o yaml | grep 'image: docker'
    kubectl -n population get cronjobs population-popbot-hourly -o yaml | grep 'image: docker'
end
