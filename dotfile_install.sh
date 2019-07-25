#!/bin/bash


# ROOT files
files=(".bash_aliases" ".bashrc" ".inputrc" ".profile" ".tmux.conf")

path=$HOME
for file in "${files[@]}"
do
   [ -f $path/$file ] && [ ! -L $path/$file ] && rm $path/$file
   [ ! -f $path/$file ] && ln -s $(pwd)/$file $path
done

# .config

conf=$HOME/.config
[ ! -e $conf ] && mkdir $conf
dirs=("nvim" "qutebrowser" "triadactyl" "zathura")
for dir in "${dirs[@]}"
do
		[ -e $conf/$dir ] && rm $conf/$dir
done

files=("katerc" "katevirc" "konsolerc" "kwinrc" "kwinrulesrc" "nvim" "plasma-localerc" "plasma-nm" "plasmanotifyrc" "plasma-org.kde.plasma.desktop-appletsrc" "plasmarc" "plasmashellrc" "qutebrowser" "tridactyl" "user-dirs.dirs" "yakuake.notifyrc" "yakuakerc" "zathura")

for file in "${files[@]}"
do
		[ -f $conf/$file ] && [ ! -L $conf/$file ] && rm $conf/$file
done
ln -s $(pwd)/.config/* $conf


# mozilla
[ ! -e  $HOME/.mozilla/firefox/current/ ] && mkdir -p $HOME/.mozilla/firefox/current/
ln -s $(pwd)/.mozilla/firefox/current/* $HOME/.mozilla/firefox/current/

#.ssh
path="$HOME/.ssh"
[ ! -e $path ] && mkdir $path
[ -f .$path/ssh_alias ] && [ ! -L $path/ssh_alias ] && rm $path/ssh_alias
ln -s $(pwd)/.ssh/ssh_alias $path

