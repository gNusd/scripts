#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

source $script_dir/config

if [ $1 == "neon" ];
then
		# apt repository
		sudo add-apt-repository multiverse
		sudo add-apt-repository ppa:neovim-ppa/stable
		sudo add-apt-repository ppa:nilarimogard/webupd8
		sudo apt update
		sudo pkcon refresh -p && sudo pkcon update -py
		pacmanager="pkcon"
		echo "$timestamp added repos" >> $log

elif [ $1 == "mageia" ];
then
		sudo urpmi.removemedia -a
		sudo urpmi.addmedia --distrib --mirrorlist 'http://mirrors.mageia.org/api/mageia.cauldron.x86_64.list'
		sudo urpmi --auto-update --auto
		pacmanager="dnf"
		echo "$timestamp added cauldron repos" >> $log
fi

# general packages 
gen_pac="tmux curl neovim neovim-qt gimp gimp-help-sv htop zathura redshift yakuake tlp tlp-rdw"
neon_pac="kontact kate kubuntu-driver-manager libreoffice libreoffice-style-breeze ttf-mscorefonts-installer kubuntu-restricted-extras gufw syncthing"
neon_dep_pac="python-pip python3-pip build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel qtbase5-dev qtwebengine5-dev extra-cmake-modules qtdeclarative5-dev libkf5windowsystem-dev libkf5plasma-dev libsm-dev libqt5x11extras5-dev dmidecode"
mageia_pac="flatpak fwupd nextcloud-client nextcloud-client-dolphin keepassxc kate"
mageia_dep_pac="python3-cairo-devel python-gobject-devel python3-blockdev gobject-introspection lib64dbus-glib-devel lib64python3-devel make lib64x11-devel python-dbus-devel lib64dbusmenu-gtk2 lib64dbusmenu-gtk3"

# apt install applications
sudo $pacmanager install -y  $gen_pac
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

if [ $1 == "neon" ]
then
	sudo $pacmanager install -y $neon_pac $neon_dep_pac
	sudo snap install cmake --classic
	sudo snap install fwupd --classic
	sudo snap install youtube-dl
	sudo flatpak install flathub org.nextcloud.Nextcloud -y
	sudo flatpak install flathub org.keepassxc.KeePassXC -y
	apps="kwrite"
	echo "$timestamp installed snaps, flatpaks and apps from repo" >> $log
elif [ $1 == "mageia" ]
then
	sudo $pacmanager install -y $mageia_pac $mageia_dep_pac  
	sudo flatpak install flathub me.kozec.syncthingtk -y
	apps="kwrite dragon clementine marble k3b"
	echo "$timestamp installed flatpaks and apps from repo" >> $log
fi

sudo flatpak install flathub org.qutebrowser.qutebrowser -y
sudo flatpak install flathub com.valvesoftware.Steam -y
sudo flatpak install flathub com.visualstudio.code -y

# sudo pip install ntfy
bash $HOME/repositories/scripts/native_tridactyl.sh
echo "$timestamp installed tridactyl" >> $log
# removing software
sudo $pacmanager remove -y $apps 
echo "$timestamp removed selected apps" >> $log