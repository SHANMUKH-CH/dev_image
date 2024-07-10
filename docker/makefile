# Specify the shell for executing commands
SHELL := /usr/bin/bash

# Packer template name
TARGET_TAG := latest
DESTINATION_TAG ?= shanumbra/dev
FILE_NAME := docker-image.pkr.hcl

# Declare the targets that don't correspond to files
.PHONY: initialize format validate build push delete

# Target: Packer initialize
initialize: 
	packer init $(FILE_NAME)

# Target: Packer format
format: 
	packer fmt $(FILE_NAME)

# Target: Packer validate
validate: 
	packer validate $(FILE_NAME)

# Target: Packer build
build: 
	packer build $(FILE_NAME)

# Target: push the docker image to Registry
push:
	docker push $(DESTINATION_TAG):$(TARGET_TAG)

# Target: To remove the dangling images
delete:
	docker image prune -f --filter "dangling=true"

# Target: Chain the steps together by specifying dependencies
all: initialize format validate build push delete

# Add .ONESHELL to execute all commands in a single shell, necessary for preserving variable values
.ONESHELL: