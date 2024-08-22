
SHELL := /usr/bin/bash

.PHONY: token build run

token:
	./get-token.sh > token.env

build:
	source token.env && docker build --build-arg REPO_URL=$$REPO_URL --build-arg RUNNER_TOKEN=$$RUNNER_TOKEN -t self-hosted-runner .

run:
	docker run --rm -it self-hosted-runner:latest

all: token build run

.ONESHELL:
