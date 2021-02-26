function aws-profile -d 'Switch AWS profile'
    set -gx AWS_PROFILE $argv
    set -gx AWS_DEFAULT_REGION (aws configure get --profile $argv region)
    echo Profile switched to $argv
    echo AWS_DEFAULT_REGION $AWS_DEFAULT_REGION
end
