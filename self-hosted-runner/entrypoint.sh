#!/usr/bin/env bash

# Run the config script with the correct parameters
./config.sh --url $REPO_URL --token $RUNNER_TOKEN --unattended --replace

# Start the runner
./run.sh
