#!/bin/bash

if [[ ! -e "$HOME/.config/nvim" ]]; then
    ln -s "$(pwd)" "$HOME/.config/nvim"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get -yq install ripgrep
    sudo apt-get -yq install fd-find
    sudo apt-get -yq install xsel
    sudo apt-get -yq install ncdu htop
    sudo apt-get -yq install tmux
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
    brew install fd
    brew install ncdu htop
    brew install tmux
fi

pip install --upgrade pip
pip install pynvim
pip install pyright

if command -v pyenv &> /dev/null; then
    if [[ ! -d "$(pyenv root)/plugins/pyenv-pyright" ]]; then
        git clone "https://github.com/alefpereira/pyenv-pyright.git" "$(pyenv root)/plugins/pyenv-pyright"
    fi
fi
