#!/bin/sh

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" && echo "$timestamp installed tmux plugin manager (tpm)" >> "$LOG"

# nvim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip install pynvim
pip3 install pynvim
