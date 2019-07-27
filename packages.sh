#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y tmux curl pyjoke cowsay python-pip python3-pip neovim neovim-qt kontact build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel qtbase5-dev qtwebengine5-dev extra-cmake-modules qtdeclarative5-dev libkf5windowsystem-dev libkf5plasma-dev libsm-dev libqt5x11extras5-dev gimp steam-installer prime-indicator-plus

sudo apt remove --purge -y vi vim-tiny

sudo snap install cmake --classic
sudo snap install fwupd --classic
sudo snap install nextcloud-client --classic
sudo snap connect nextcloud-client:password-manager-service
sudo snap install yakuake --stable
sudo snap install keepassxc
sudo snap install solus-runtime-gaming
sudo snap install youtube-dl

sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
