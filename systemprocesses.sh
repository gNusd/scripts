#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

source $script_dir/config

sudo start tlp && echo "$timestamp started tlp" >> $log
sudo echo "vm.swapiness = 10" >> /etc/sysctl.conf  && echo "$timestamp swapiness = 10" >> $log 
sudo systemctl enable syncthing@$USER.service  && echo "$timestamp started syncthing@$USER.service" >> $log