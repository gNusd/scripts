#!/bin/bash


if [ $1 == "neon" ];
then
		sudo add-apt-repository multiverse
		sudo pkcon refresh -p && sudo pkcon update -py
		pacmanager="pkcon"

elif [ $1 == "mageia" ];
then
		urpmi.removemedia -a
		urpmi.addmedia --distrib --mirrorlist 'http://mirrors.mageia.org/api/mageia.cauldron.x86_64.list'
		urpmi --auto-update --auto
		pacmanager="dnf"
fi

sudo $pacmanager autoremove -y

# general packages 
gen_pac="tmux curl neovim neovim-qt gimp gimp-help-sv htop zathura redshift yakuake tlp tlp-rdw"
neon_pac="kontact kate kubuntu-driver-manager libreoffice libreoffice-style-breeze ttf-mscorefonts-installer kubuntu-restricted-extras gufw syncthing"
dep_pac="python-pip python3-pip build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel qtbase5-dev qtwebengine5-dev extra-cmake-modules qtdeclarative5-dev libkf5windowsystem-dev libkf5plasma-dev libsm-dev libqt5x11extras5-dev"
mageia_pac="flatpak python3-cairo-devel python-gobject-devel python3-blockdev gobject-introspection lib64dbus-glib-devel lib64python3-devel make lib64x11-devel python-dbus-devel"
# apt install applications
sudo $pacmanager install -y  $gen_pac
[ $1 == "neon" ] && sudo $pacmanager install -y $neon_pac
[ $1 == "mageia" ] && sudo $pacmanager install -y $mageia_pac 
# apt install dependencies
sudo $pacmanager install -y $dep_pac 

if [ $1 == "neon" ]
then
		sudo snap install cmake --classic
		sudo snap install fwupd --classic
		sudo snap install youtube-dl
fi
python3-cairo-devel python-gobject-devel python3
if [ $1 == "mageia" ] 
then 
		sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi 

sudo flatpak install flathub org.nextcloud.Nextcloud
sudo flatpak install flathub org.keepassxc.KeePassXC
sudo flatpak install flathub org.qutebrowser.qutebrowser
sudo flatpak install flathub com.valvesoftware.Steam
sudo flatpak install flathub com.visualstudio.code

sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
