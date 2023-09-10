#!/usr/bin/env bash
set -xe

apt-get update && apt-get upgrade && apt-get autoremove && apt clean

# install the required packages
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
        wget \
        parallel \
        sshpass \
        ruby \
        python3-dev \
        python3-pip \
        python3-setuptools

# install fuck: https://github.com/nvbn/thefuck
pip3 install thefuck --user
export PATH="/root/.local/bin:$PATH"
# echo "eval $(thefuck --alias)" >> ~/.zshrc
# exec zsh

# install lazy docker: https://github.com/jesseduffield/lazydocker (optional)