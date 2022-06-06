#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! command -v pyenv &> /dev/null; then
    echo "Install pyenv first: https://github.com/pyenv/pyenv" >&2
    echo "Install pyenv-virtualenv first: https://github.com/pyenv/pyenv-virtualenv" >&2
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "Install node first" >&2
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "Install npm first" >&2
    exit 1
fi

if ! command -v python &> /dev/null; then
    echo "Install python 3 first" >&2
    exit 1
fi

if ! command -v pip &> /dev/null; then
    echo "Install pip first" >&2
    exit 1
fi

if [[ ! -e "$HOME/.config/nvim" ]]; then
    ln -s "$(pwd)" "$HOME/.config/nvim"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get -yq install neovim
    sudo apt-get -yq install ripgrep
    sudo apt-get -yq install fd-find
    sudo apt-get -yq install xsel
    sudo apt-get -yq install ncdu htop
    sudo apt-get -yq install tmux
    sudo apt-get -yq install llvm
    sudo apt-get -yq install cmake
    sudo apt-get -yq install lazygit
    sudo apt-get -yq install fortune
    # TODO: install dotnet
    sudo apt-get -yq install golang-go
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install neovim
    brew install ripgrep
    brew install fd
    brew install ncdu htop
    brew install tmux
    brew install llvm
    brew install cmake
    brew install --cask dotnet-sdk
    brew install golang
    brew install lazygit
    brew install fortune
fi

pip install --upgrade pip
pip install pynvim
pip install pyright
pip install mypy
pip install flake8
pip install black

if [[ ! -d "$(pyenv root)/plugins/pyenv-pyright" ]]; then
    git clone "https://github.com/alefpereira/pyenv-pyright.git" "$(pyenv root)/plugins/pyenv-pyright"
fi

npm install -g neovim
npm install -g remark
npm install -g remark-gfm
