#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y tmux curl pyjoke cowsay python-pip python3-pip neovim neovim-qt
sudo apt remove --purge -y vi vim-tiny
sudo snap install fwupd
sudo snap install nextcloud-client --classic
snap connect nextcloud-client:password-manager-service
sudo snao install yakuake
sudo snap install keepassxc


sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
