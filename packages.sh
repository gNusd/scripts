#!/bin/bash

sudo add-apt-repository multiverse

if [ $1 == "kubuntu" ];
then
		sudo apt update && sudo apt upgrade -y
elif [ $1 == "neon" ];
then
		sudo pkcon refresh -p && sudo pkcon update -py
fi

sudo apt autoremove -y

# apt install applications
sudo apt install -y  tmux curl pyjoke cowsay neovim neovim-qt gimp gimp-help-sv prime-indicator-plus glances htop zathura transmission-qt virtualbox virtualbox-qt virtualbox-ext-pack redshift yakuake

# apt install dependencies
sudo apt install -y python-pip python3-pip build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel qtbase5-dev qtwebengine5-dev extra-cmake-modules qtdeclarative5-dev libkf5windowsystem-dev libkf5plasma-dev libsm-dev libqt5x11extras5-dev

sudo apt remove --purge -y vim-tiny vim

sudo snap install cmake --classic
sudo snap install fwupd --classic
sudo snap install youtube-dl

sudo flatpak install flathub org.nextcloud.Nextcloud
sudo flatpak install flathub org.keepassxc.KeePassXC
sudo flatpak install flathub org.qutebrowser.qutebrowser
sudo flatpak install flathub com.valvesoftware.Steam
sudo flatpak install flathub com.visualstudio.code
sudo flatpak install flathub org.kde.kontact

sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
