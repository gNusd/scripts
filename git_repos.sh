#!/bin/bash

git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo "$BASE_DIR"/lenovo-throttling-fix/install.sh && echo "$timestamp cloned/installed lenovo-throttling-fix.git" >> "$LOG"

enviroment=$(sudo dmidecode | grep Product)
if [ "$enviroment" != "Product Name: VirtualBox" ]
then
    git clone git@github.com:ryanoasis/nerd-fonts.git
    "$BASE_DIR"/nerd-fonts/install.sh && echo "$timestamp cloned/installed nerd-fonts.git" >> "$LOG"
fi


git clone git@github.com:sieren/QSyncthingTray.git
cd "$BASE_DIR"/QSyncthingTray || return

mkdir build && cd build || return
cmake .. && make && echo "$timestamp cloned/installed qsyncthingtray.git" >> "$LOG"

git clone git@github.com:spaam/svtplay-dl.git
cd "$BASE_DIR"/svtplay-dl || return
sudo python3 setup.py install && echo "$timestamp cloned/installed svtplay-dl.git" >> "$LOG"
cd "$BASE_DIR" || return

# Plasma scripts and plasmoids

git clone git://anongit.kde.org/plasma-active-window-control
cd "$BASE_DIR"/plasma-active-window-control || return
mkdir build && cd build || return
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
cd "$BASE_DIR" || return

git clone git@github.com:kwin-scripts/kwin-tiling.git
cd "$BASE_DIR"/kwin-tiling/ || return
plasmapkg2 --type kwinscript -i .
cd "$BASE_DIR" || return

git clone git@github.com:kotelnik/plasma-applet-uptime-widget.git
cd "$BASE_DIR"/plasma-applet-uptime-widget/package || return
plasmapkg2 -i .
cd "$BASE_DIR" || return

git clone git@github.com:psifidotos/applet-window-title.git
cd "$BASE_DIR"/applet-window-title || return
plasmapkg2 -i .
cd "$BASE_DIR" || return
echo "$timestamp cloned/installed plasmoids" >> "$LOG"
