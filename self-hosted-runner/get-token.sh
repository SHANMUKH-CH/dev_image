#!/usr/bin/bash

set -xe

declare token
declare owner
declare repo
declare REPO_URL
declare RUNNER_TOKEN

owner="SHANMUKH-CH"
repo="dev_image"

if gh auth status > /dev/null 2>&1; then
    token=$(gh api --method POST -H "Accept: application/vnd.github.v3+json" repos/SHANMUKH-CH/dev_image/actions/runners/registration-token | jq -r .token)
else
    echo ">>> Not logged in to github.com as $owner"
    exit 1
fi

if [ -z "$token" ]; then
    echo ">>> Failed to get registration token"
    exit 1
else
    REPO_URL="https://github.com/${owner}/${repo}"
    RUNNER_TOKEN="${token}"
    echo "REPO_URL=${REPO_URL}"
    echo "RUNNER_TOKEN=${RUNNER_TOKEN}"
fi
