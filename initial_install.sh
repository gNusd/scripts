#!/bin/bash

sudo apt install tmux curl pyjoke cowsay
sudo apt remove --purge vi vim-tiny
sudo snap install neovim-kalikiana fwupd nextcloud-client yakuake keepassxc

./native_tridactyl.sh
