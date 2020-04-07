#!/bin/sh

sudo tlp start && echo "$timestamp started tlp" >> "$LOG"
sudo systemctl enable "syncthing@$USER.service"  && echo "$timestamp started syncthing@$USER.service" >> "$LOG"
