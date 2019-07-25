#!/bin/bash

basedir=$($HOME/repositories/)

cd $basedir
git clone git@github.com:gNusd/scripts.git
git clone git@github.com:gNusd/dotfiles.git
cd $basedir/dotfiles/
bash $basedir/scripts/dotfile_install.sh
cd $basedir

[ ! -e $HOME/bin ] && mkdir $HOME/bin
git clone git@github.com:gNusd/local-bin.git $HOME/bin

bash $basedir/scripts/packages.sh

git clone git@github.com:ryanoasis/nerd-fonts.git
git clone git@github.com:sieren/QSyncthingTray.git
git clone git@github.com:erpalma/throttled.git


