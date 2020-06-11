function aws-profile -d 'Switch AWS profile'
    set -gx AWS_PROFILE $argv
    set -gx AWS_ACCESS_KEY_ID (aws configure get --profile $argv aws_access_key_id)
    set -gx AWS_SECRET_ACCESS_KEY (aws configure get --profile $argv aws_secret_access_key)
    set -gx AWS_SESSION_TOKEN (aws configure get --profile $argv aws_access_key_id)
    set -gx AWS_DEFAULT_REGION (aws configure get --profile $argv region)
    echo Profile switched to $argv
    echo AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
    echo AWS_SESSION_TOKEN $AWS_ACCESS_KEY_ID
    echo AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
    echo AWS_DEFAULT_REGION $AWS_DEFAULT_REGION
end
