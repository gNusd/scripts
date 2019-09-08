#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

source $script_dir/config


git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo $basedir/lenovo-throttling-fix/install.sh && echo "$timestamp cloned/installed lenovo-throttling-fix.git" >> $log

enviroment=$(dmidecode | grep Product)
if [ $enviroment != "Product Name: VirtualBox" ]
then
    git clone git@github.com:ryanoasis/nerd-fonts.git
    $basedir/nerd-fonts/install.sh && echo "$timestamp cloned/installed nerd-fonts.git" >> $log
fi


if [ $1 == "neon" ]
then
    git clone git@github.com:sieren/QSyncthingTray.git
    cd $basedir/QSyncthingTray

    mkdir build && cd build
    cmake .. && make && echo "$timestamp cloned/installed qsyncthingtray.git" >> $log

    git clone git@github.com:spaam/svtplay-dl.git
    cd $basedir/svtplay-dl
    sudo python3 setup.py install && echo "$timestamp cloned/installed svtplay-dl.git" >> $log
    cd $basedir

# Plasma scripts and plasmoids


    git clone git://anongit.kde.org/plasma-redshift-control
    cd $basedir/plasma-redshift-control
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
    sudo make install
    cd $basedir

    git clone git://anongit.kde.org/plasma-active-window-control
    cd $basedir/plasma-active-window-control
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
    sudo make install
    cd $basedir

    git clone git@github.com:kwin-scripts/kwin-tiling.git
    cd $basedir/kwin-tiling/
    plasmapkg2 --type kwinscript -i .
    cd $basedir

    git clone git@github.com:kotelnik/plasma-applet-uptime-widget.git
    cd $basedir/plasma-applet-uptime-widget/package
    plasmapkg2 -i .
    cd $basedir

    git clone git@github.com:psifidotos/applet-window-title.git
    cd $basedir/applet-window-title
    plasmapkg2 -i .
    cd $basedir
    echo "$timestamp cloned/installed plasmoids" >> $log
fi
