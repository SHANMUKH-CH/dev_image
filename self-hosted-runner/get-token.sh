#!/usr/bin/bash

set -xe

#./config.sh --url https://github.com/SHANMUKH-CH/dev_image --token XXXXXXXXXXXXXXXXXXXXXXXXXX

declare token
declare owner
declare repo
declare REPO_URL
declare RUNNER_TOKEN

owner="SHANMUKH-CH"
repo="dev_image"

if gh auth status; then
    token=$(gh api --method POST -H "Accept: application/vnd.github.v3+json" repos/SHANMUKH-CH/dev_image/actions/runners/registration-token | jq -r .token)
    echo ">>> Logged in to github.com as $owner"
    echo ">>> Registration token: $token"
else
    echo ">>> Not logged in to github.com as $owner"
    exit 1
fi

if [ -z "$token" ]; then
    echo ">>> Failed to get registration token"
    exit 1
else
    echo "Registration token: $token"
    export REPO_URL="https://github.com/${owner}/${repo}"
    export RUNNER_TOKEN="${token}"
fi
