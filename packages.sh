#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y tmux curl pyjoke cowsay python-pip python3-pip neovim neovim-qt
sudo apt remove --purge -y vi vim-tiny
sudo snap install cmake --classic
sudo snap install fwupd --classic
sudo snap install nextcloud-client --classic
sudo snap connect nextcloud-client:password-manager-service
sudo snap install yakuake
sudo snap install keepassxc


sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
