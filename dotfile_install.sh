#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

source $script_dir/config 


# ROOT files
if [ $1 == "neon" ]
then
      files=(".bash_aliases" ".bashrc" ".inputrc" ".profile" ".tmux.conf")
elif [ $1 == "mageia" ]
then
      files=(".bash_aliases" ".inputrc" ".profile" ".tmux.conf")
fi 

path=$HOME
for file in "${files[@]}"
do
   [ -f $path/$file ] && [ ! -L $path/$file ] && rm $path/$file
   [ ! -f $path/$file ] && ln -s $(pwd)/$file $path
done
echo "$timestamp linked $files" >> $log
# .config

conf=$HOME/.config
[ ! -e $conf ] && mkdir $conf
dirs=("nvim" "qutebrowser" "triadactyl" "zathura")
for dir in "${dirs[@]}"
do
		[ -e $conf/$dir ] && rm $conf/$dir
      [ ! -e $conf/$dir ] && ln -s $(pwd)/.config/$dir $conf 
done

echo "$timestamp linked $dirs" >> $log

if [ $1 == "neon" ]
then 
      files=("katerc" "katevirc" "konsolerc" "kwinrc" "kwinrulesrc" "plasma-localerc" "plasma-nm" "plasmanotifyrc" "plasma-org.kde.plasma.desktop-appletsrc" "plasmarc" "plasmashellrc" "user-dirs.dirs" "yakuake.notifyrc" "yakuakerc")
elif [ $1 == "mageia" ]
then 
      files=("katerc" "katevirc" "konsolerc" "user-dirs.dirs" "yakuake.notifyrc" "yakuakerc")
fi

for file in "${files[@]}"
do
		[ -f $conf/$file ] && [ ! -L $conf/$file ] && rm $conf/$file
      [ ! -f $conf/$file ] && ln -s $(pwd)/.config/$file $conf
done

echo "$timestamp linked $files" >> $log

# mozilla
[ ! -e  $HOME/.mozilla/firefox/current/ ] && mkdir -p $HOME/.mozilla/firefox/current/
ln -s $(pwd)/.mozilla/firefox/current/* $HOME/.mozilla/firefox/current/

echo "$timestamp linked mozilla firefox dir" >> $log

#.ssh
path="$HOME/.ssh"
[ ! -e $path ] && mkdir $path
[ -f .$path/ssh_alias ] && [ ! -L $path/ssh_alias ] && rm $path/ssh_alias
ln -s $(pwd)/.ssh/ssh_alias $path

echo "$timestamp linked ssh_alias" >> $log