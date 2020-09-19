#!/bin/bash


[ ! -e "$HOME/tmp" ] && mkdir "$HOME/tmp"

## Exporting variables
export "BASE_DIR=$HOME/repositories"
export "PACKAGE_INSTALLER=pkcon"
export "SCRIPT_DIR=$HOME/repositories/scripts"
export "DOTDIR=$BASE_DIR/dotfiles"
export "CONF_DIR=$HOME/.config"
export "LOG=$HOME/tmp/install.log"
export "timestamp=$(date +'%T')"
export "shell=bash"

echo "$timestamp started installing " >> "$LOG"

sudo $PACKAGE_INSTALLER install git -y

# renamning and creating directories
[ -e  "$HOME/Hämtningar" ] && mv "$HOME/Hämtningar" "$HOME/hämtningar" && echo "$timestamp renamned download" >> "$LOG"
[ ! -e "$HOME/nextcloud" ] && mkdir "$HOME/nextcloud" && echo "$timestamp created nextcloud" >> "$LOG"
[ ! -e "$HOME/projects" ] && mkdir "$HOME/projects" && echo "$timestamp created projects" >> "$LOG"
[ ! -e "$HOME/virtualbox" ] && mkdir "$HOME/virtualbox" && echo "$timestamp created virtualbox" >> "$LOG"
[ ! -e "$HOME/repositories" ] && mkdir "$HOME/repositories" && echo "$timestamp created repositories" >> "$LOG"
[ ! -e "$HOME/bin" ] && mkdir "$HOME/bin" && echo "$timestamp created ~/bin" >> "$LOG"
[ ! -e "$HOME/.tmux" ] && mkdir -p "$HOME/.tmux/plugins/" && echo "$timestamp created .tmux/plugins" >> "$LOG"

# deleting directories
[ -e  "$HOME/Bilder" ] && rm -rf "$HOME/Bilder" && echo "$timestamp removed pictures" >> "$LOG"
[ -e  "$HOME/Dokument" ] && rm -rf "$HOME/Dokument" && echo "$timestamp removed documents" >> "$LOG"
[ -e  "$HOME/Mallar" ] && rm -rf "$HOME/Mallar" && echo "$timestamp removed templates" >> "$LOG"
[ -e  "$HOME/Musik" ] && rm -rf "$HOME/Musik" && echo "$timestamp removed music" >> "$LOG"
[ -e  "$HOME/Publikt" ] && rm -rf "$HOME/Publikt" && echo "$timestamp removed public" >> "$LOG"
[ -e  "$HOME/Video" ] && rm -rf "$HOME/Video" && echo "$timestamp removed video" >> "$LOG"

[ -f "$DOTDIR/.config/user-dirs.dirs" ] && ln -s "$DOTDIR/.config/user-dirs.dirs" "$CONF_DIR" && echo "$timestamp installed user-dirs.dirs" >> "$LOG"

cd "$BASE_DIR" || return
#
SSH_ASKPASS="/usr/bin/ksshaskpass" ssh-add < /dev/null

git clone git@github.com:gnusd/scripts.git && echo "$timestamp cloning scripts.git" >> "$LOG"

"$shell" "$SCRIPT_DIR/packages.sh"

# clone and install dotfiles
git clone git@github.com:gnusd/dotfiles.git && echo "$timestamp cloning dotfiles.git" >> "$LOG"
cd "$BASE_DIR/dotfiles/" || return
"$shell" "$SCRIPT_DIR/dotfile_install.sh"
cd "$BASE_DIR" || return

git clone git@github.com:gnusd/local-bin.git "$HOME/bin" && echo "$timestamp cloned ~/bin" >> "$LOG"

"$shell" "$SCRIPT_DIR/tmux-nvim.sh"
"$shell" "$SCRIPT_DIR/native_tridactyl.sh"
"$shell" "$SCRIPT_DIR/git_repos.sh"
sudo tlp start && echo "$timestamp started tlp" >> "$LOG"

rm "$HOME/init.sh" &&  echo "$timestamp removed install script" >> "$LOG"

sudo apt autoremove -y && echo "$timestamp Post install clean up" >> "$LOG"
echo "$timestamp Finished installing" >> "$LOG" && echo "Finished installing"

#Unset variables
unset "BASE_DIR"
unset "SCRIPT_DIR"
unset "PACKAGE_INSTALLER"
unset "LOG"
unset "timestamp"
unset "shell"

printf '%s' "Reboot now [y/N] "
read -r response

if [ "$response" != "${response#[Yy]}" ] ;then
		sudo shutdown -r now
else
		exit
fi
