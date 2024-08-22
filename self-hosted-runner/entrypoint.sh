#!/bin/bash

# GitHub Runner registration
./config.sh --url $REPO_URL --token $RUNNER_TOKEN --unattended --replace

# Run the runner
./run.sh
