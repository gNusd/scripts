#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y tmux curl pyjoke cowsay
sudo apt remove --purge -y vi vim-tiny
sudo snap install neovim-kalikiana fwupd nextcloud-client yakuake keepassxc

bash native_tridactyl.sh
