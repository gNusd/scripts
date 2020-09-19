#!/bin/bash

# ROOT files
files=(".zshrc" ".inputrc" ".profile" ".tmux.conf")

path=$HOME
for file in "${files[@]}"
do
		[ -f "$path/$file" ] && [ ! -L "$path/$file" ] && rm "$path/$file"
		[ ! -f "$path/$file" ] && ln -s "$(pwd)/$file $path"
		echo "$timestamp linked $file" >> "$LOG"
done
# .config

conf=$HOME/.config
[ ! -e "$conf" ] && mkdir "$conf"
dirs=("nvim" "qutebrowser" "triadactyl" "zathura")
for dir in "${dirs[@]}"
do
		[ -e "$conf/$dir" ] && rm "$conf/$dir"
		[ ! -e "$conf/$dir" ] && ln -s "$(pwd)/.config/$dir" "$conf"
		echo "$timestamp linked $dir" >> "$LOG"
done


files=("katerc" "katevirc" "konsolerc" "kwinrc" "kwinrulesrc" "plasma-localerc" "plasma-nm" "plasmanotifyrc" "plasma-org.kde.plasma.desktop-appletsrc" "plasmarc" "plasmashellrc" "user-dirs.dirs" "yakuake.notifyrc" "yakuakerc")

for file in "${files[@]}"
do
		[ -f "$conf/$file" ] && [ ! -L "$conf/$file" ] && rm "$conf/$file"
		[ ! -f "$conf/$file" ] && ln -s "$(pwd)/.config/$file" "$conf"
		echo "$timestamp linked $file" >> "$LOG"
done


# mozilla
MOZ_DIR="$HOME/.mozilla/firefox"
[ ! -e  "$MOZ_DIR/current/" ] && mkdir -p "$MOZ_DIR/current/"
ln -s "$(pwd)/.mozilla/firefox/current/*" "$MOZ_DIR/current/"

default=$(ls "$MOZ_DIR"/ | grep default)
for dir in $default
do
		num_files=$(ls $dir | wc -l)
		[ "$num_files" -gt 20 ] && firefox_dir="$dir"
done
ln -s "$MOZ_DIR/$firefox_dir/*" "$MOZ_DIR/current/"
echo "$timestamp linked mozilla firefox dir" >> "$LOG"

#.ssh
path="$HOME/.ssh"
[ ! -e "$path" ] && mkdir "$path"
[ -f "$path/ssh_alias" ] && [ ! -L "$path/ssh_alias" ] && rm "$path/ssh_alias"
ln -s "$(pwd)/.ssh/ssh_alias $path"

echo "$timestamp linked ssh_alias" >> "$LOG"
