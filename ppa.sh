#!/bin/bash

# apt repository
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update

# flatpak repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
