
SHELL := /usr/bin/bash

.PHONY: token build run

token:
	./get-token.sh

build:
	docker build -t self-hosted-runner .

run:
	./launch.sh

all: token build run

.ONESHELL:
