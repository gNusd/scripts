#!/bin/bash

[ -e  $HOME/Hämtningar] && mv $HOME/Hämtningar $HOME/hämtningar
[ ! -e $HOME/nextcloud ] && mkdir $HOME/nextcloud
[ ! -e $HOME/projects ] && mkdir $HOME/projects
[ ! -e $HOME/virtualbox ] && mkdir $HOME/virtualbox
[ ! -e $HOME/tmp ] && mkdir $HOME/tmp
[ ! -e $HOME/repositories ] && mkdir $HOME/repositories
[ ! -e $HOME/bin ] && mkdir $HOME/bin

[ -e  $HOME/Bilder ] && rm $HOME/Bilder
[ -e  $HOME/Dokument ] && rm $HOME/Dokument
[ -e  $HOME/Mallar ] && rm $HOME/Mallar
[ -e  $HOME/Musik ] && rm $HOME/Musik
[ -e  $HOME/Publikt ] && rm $HOME/Publikt
[ -e  $HOME/Skrivbord ] && rm $HOME/Skrivbord
[ -e  $HOME/Video ] && rm $HOME/Video

sudo apt install git

basedir=$HOME/repositories/

cd $basedir
git clone git@github.com:gNusd/scripts.git
git clone git@github.com:gNusd/dotfiles.git
cd $basedir/dotfiles/
bash $basedir/scripts/dotfile_install.sh
cd $basedir

git clone git@github.com:gNusd/local-bin.git $HOME/bin

bash $basedir/scripts/packages.sh
