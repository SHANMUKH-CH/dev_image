#!/usr/bin/env bash
set -xe

apt-get update && apt-get upgrade && apt-get autoremove && apt clean

apt-get install -y  man \
        build-essential \
        gcc \
        g++ \
        make \
        zsh \
        git \
        vim \
        locate \
        curl \
        wget