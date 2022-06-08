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
    sudo apt-get -yq install lldb
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install --cask dotnet-sdk
    lldb --version
fi
brew install neovim
brew install ripgrep
brew install fd
brew install ncdu htop
brew install tmux
brew install llvm
brew install cmake
brew install golang
brew install lazygit
brew install fortune
brew install bashdb
brew install code-minimap

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
