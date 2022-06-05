#!/bin/bash

if [[ ! -e "$HOME/.config/nvim" ]]; then
    ln -s "$(pwd)" "$HOME/.config/nvim"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install ripgrep
    sudo apt install fd-find
    sudo apt install xsel
    sudo apt install fonts-firacode
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
    brew install fd

    brew tap homebrew/cask-fonts
    brew install font-fira-code font-fira-mono font-fira-mono-for-powerline font-fira-sans
fi

pip install pynvim
