#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y tmux curl pyjoke cowsay
sudo apt remove --purge -y vi vim-tiny
sudo snap install neovim-kalikiana
sudo snap install fwupd
sudo snap install nextcloud-client
sudo snao install yakuake
sudo snap install keepassxc

bash $HOME/repositories/scripts/native_tridactyl.sh
