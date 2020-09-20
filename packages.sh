#!/bin/sh

[ "$PACKAGE_INSTALLER" = "pkcon" ] && UPDATE="sudo pkcon refresh -p && sudo pkcon update -py"
[ "$PACKAGE_INSTALLER" = "apt" ] && UPDATE="sudo apt update && sudo apt upgrade -y"

# apt repository
sudo add-apt-repository universe && echo "$timestamp added universe" >> "$LOG"
sudo add-apt-repository multiverse && echo "$timestamp added multiverse" >> "$LOG"
sudo add-apt-repository ppa:nilarimogard/webupd8 && echo "$timestamp added webupd8 ppa" >> "$LOG"
$UPDATE && echo "$timestamp updating the system" >> "$LOG"

# general packages
gen_pac="tmux gimp gimp-help-sv htop zathura yakuake tlp tlp-rdw kontact kate kubuntu-driver-manager libreoffice libreoffice-style-breeze ttf-mscorefonts-installer kubuntu-restricted-extras gufw"
dep_pac="build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel qtbase5-dev qtwebengine5-dev extra-cmake-modules qtdeclarative5-dev libkf5windowsystem-dev libkf5plasma-dev libsm-dev libqt5x11extras5-dev python3-pip"

echo "$timestamp selected package manager = $PACKAGE_INSTALLER"  >> "$LOG"
# apt install applications
sudo "$PACKAGE_INSTALLER" install -y  "$gen_pac" "$dep_pac" && echo "$timestamp installed $gen_pac $dep_pac" >> "$LOG"

# Install snap packages
sudo snap install cmake --classic && echo "$timestamp installed cmake" >> "$LOG"
sudo snap install fwupd --classic && echo "$timestamp installed fwupd" >> "$LOG"
sudo snap install youtube-dl && echo "$timestamp installed youtube-dl" >> "$LOG"
sudo snap install nvim --classic --edge && echo "$timestamp installed nvim" >> "$LOG"

# add flathub.org repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && echo "$timestamp added flathub repo" >> "$LOG"

# Install flatpaks
sudo flatpak install flathub org.nextcloud.Nextcloud -y && echo "$timestamp installed nextcloud" >> "$LOG"
sudo flatpak install flathub com.bitwarden.desktop && echo "$timestamp installed bitwarden" >> "$LOG"
# sudo flatpak install flathub org.telegram.desktop  && echo "$timestamp installed telegram" >> "$LOG"

# remove preinstalled applications
remove_apps="kwrite vim"

# removing software
sudo "$PACKAGE_INSTALLER" remove --purge -y "$remove_apps" && echo "$timestamp removed $remove_apps" >> "$LOG"
sudo "$PACKAGE_INSTALLER" autoremove -y && echo "$timestamp autoremoved" >> "$LOG"
