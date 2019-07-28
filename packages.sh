#!/bin/bash

sudo add-apt-repository multiverse
sudo apt update && sudo apt upgrade -y
# sudo pkcon refresh -p && sudo pkcon update -py
sudo apt autoremove -y

# apt install applications
sudo apt install -y  tmux curl pyjoke cowsay neovim neovim-qt kontact gimp gimp-help-sv steam-installer prime-indicator-plus glances htop zathura transmission-qt virtualbox virtualbox-qt virtualbox-ext-pack redshift flatpak

# apt install dependencies
sudo apt install -y python-pip python3-pip build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel qtbase5-dev qtwebengine5-dev extra-cmake-modules qtdeclarative5-dev libkf5windowsystem-dev libkf5plasma-dev libsm-dev libqt5x11extras5-dev

sudo apt remove --purge -y vim-tiny

sudo snap install cmake --classic
sudo snap install fwupd --classic
sudo snap install yakuake --candidate
sudo snap install keepassxc
sudo snap install solus-runtime-gaming --edge
sudo snap install youtube-dl

flatpak install flathub org.nextcloud.Nextcloud

sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
