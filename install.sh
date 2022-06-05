#!/bin/bash

if [[ ! -e "$HOME/.config/nvim" ]]; then
	ln -s "$(pwd)" "$HOME/.config/nvim"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	sudo apt install ripgrep
	sudo apt install fd-find
	sudo apt install xsel
elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install ripgrep
	brew install fd
fi

pip install pynvim
