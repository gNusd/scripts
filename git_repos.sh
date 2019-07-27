#!/bin/bash

basedir="$HOME/repositories"

sudo apt install build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel

git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo $basedir/lenovo-throttling-fix/install.sh



git clone git@github.com:kwin-scripts/kwin-tiling.git
cd $basedir/kwin-tiling/
plasmapkg2 --type kwinscript -i .
cd $basedir

# git clone git@github.com:ryanoasis/nerd-fonts.git
# $basedir/nerd-fonts/install.sh

git clone git@github.com:sieren/QSyncthingTray.git
sudo snap install cmake -classic
sudo apt install qtbase5-dev qtwebengine5-dev
cd $basedir/QSyncthingTray

mkdir build && cd build
cmake .. && make

