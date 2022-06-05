#!/bin/bash

if [[ ! -e "$HOME/.config/nvim" ]]; then
	ln -s "$(pwd)" "$HOME/.config/nvim"
fi

pip install pynvim
