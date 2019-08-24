#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

source $script_dir/config

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && echo "$timestamp installed tmux plugin manager (tpm)" >> $log

# nvim plugin manager
cd $HOME
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.cache/dein
rm $HOME/installer.sh && echo "$timestamp installed neovim plugin manager dein" >> $log

