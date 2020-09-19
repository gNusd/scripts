#!/bin/bash

# ROOT files
files=(".zshrc" ".inputrc" ".profile" ".tmux.conf")

for file in "${files[@]}"
do
		[ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ] && rm "$HOME/$file"
		[ ! -f "$HOME/$file" ] && ln -s "$(pwd)/$file $HOME"
		echo "$timestamp linked $file" >> "$LOG"
done

# .config
[ ! -e "$CONF_DIR" ] && mkdir "$CONF_DIR"
dirs=("nvim" "qutebrowser" "triadactyl" "zathura")
for dir in "${dirs[@]}"
do
		[ -e "$CONF_DIR/$dir" ] && rm "$CONF_DIR/$dir"
		[ ! -e "$CONF_DIR/$dir" ] && ln -s "$(pwd)/.config/$dir" "$CONF_DIR"
		echo "$timestamp linked $dir" >> "$LOG"
done


files=("katerc" "katevirc" "konsolerc" "kwinrc" "kwinrulesrc" "plasma-localerc" "plasma-nm" "plasmanotifyrc" "plasma-org.kde.plasma.desktop-appletsrc" "plasmarc" "plasmashellrc" "user-dirs.dirs" "yakuake.notifyrc" "yakuakerc")

for file in "${files[@]}"
do
		[ -f "$CONF_DIR/$file" ] && [ ! -L "$CONF_DIR/$file" ] && rm "$CONF_DIR/$file"
		[ ! -f "$CONF_DIR/$file" ] && ln -s "$(pwd)/.config/$file" "$CONF_DIR"
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
SSH_DIR="$HOME/.ssh"
[ ! -e "$SSH_DIR" ] && mkdir "$SSH_DIR"
[ -f "$SSH_DIR/alias.ssh" ] && [ ! -L "$SSH_DIR/alias.ssh" ] && rm "$SSH_DIR/alias.ssh"
ln -s "$(pwd)/.ssh/alias.ssh $SSH_DIR"

echo "$timestamp linked alias.ssh" >> "$LOG"
