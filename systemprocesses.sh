#!/bin/bash

sudo start tlp
sudo echo "vm.swapiness = 10" >> /etc/sysctl.conf
sudo systemctl enable syncthing@$USER.service
