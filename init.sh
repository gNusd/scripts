#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts
log=$HOME/install.log
timestamp=$(date +'%T')
shell=bash

echo "$timestamp started installing $1" >> $log

[ -z $1 ] && exit
if [ $1 == "neon" ];
then
		dist=$1
		sudo pkcon install git -y
		autor="apt"

elif [ $1 == "mageia" ];
then
		dist=$1
		sudo dnf install git ksshaskpass -y
		autor="dnf"
else
	echo "KDE neon (write neon) or Mageia (write mageia)"
	exit
fi
# renamning and creating directories
[ -e  $HOME/Hämtningar ] && mv $HOME/Hämtningar $HOME/hämtningar && echo "$timestamp renamned download" >> $log
[ ! -e $HOME/nextcloud ] && mkdir $HOME/nextcloud && echo "$timestamp created nextcloud" >> $log
[ ! -e $HOME/projects ] && mkdir $HOME/projects && echo "$timestamp created projects" >> $log
[ ! -e $HOME/virtualbox ] && mkdir $HOME/virtualbox && echo "$timestamp created virtualbox" >> $log
[ ! -e $HOME/tmp ] && mkdir $HOME/tmp && echo "$timestamp created tmp" >> $log
[ ! -e $HOME/repositories ] && mkdir $HOME/repositories && echo "$timestamp created repositories" >> $log
[ ! -e $HOME/bin ] && mkdir $HOME/bin && echo "$timestamp created ~/bin" >> $log
[ ! -e $HOME/.tmux ] && mkdir -p $HOME/.tmux/plugins/ && echo "$timestamp created .tmux/plugins" >> $log

# deleting directories
[ -e  $HOME/Bilder ] && rm -rf $HOME/Bilder && echo "$timestamp removed pictures" >> $log
[ -e  $HOME/Dokument ] && rm -rf $HOME/Dokument && echo "$timestamp removed documents" >> $log
[ -e  $HOME/Mallar ] && rm -rf $HOME/Mallar && echo "$timestamp removed templates" >> $log
[ -e  $HOME/Musik ] && rm -rf $HOME/Musik && echo "$timestamp removed music" >> $log
[ -e  $HOME/Publikt ] && rm -rf $HOME/Publikt && echo "$timestamp removed public" >> $log
[ -e  $HOME/Video ] && rm -rf $HOME/Video && echo "$timestamp removed video" >> $log

# defining shell
cd $basedir || return
#
SSH_ASKPASS=/usr/bin/ksshaskpass ssh-add < /dev/null

git clone git@github.com:gNusd/scripts.git && echo "$timestamp cloning scripts.git" >> $log

$shell $script_dir/packages.sh $dist

git clone git@github.com:gNusd/dotfiles.git && echo "$timestamp cloning dotfiles.git" >> $log
cd $basedir/dotfiles/ || return
$shell $script_dir/dotfile_install.sh $dist
cd $basedir || return

git clone git@github.com:gNusd/local-bin.git $HOME/bin && echo "$timestamp cloned ~/bin" >> $log

$shell $script_dir/tmux-nvim.sh
$shell $script_dir/native_tridactyl.sh
$shell $script_dir/git_repos.sh $dist
$shell $script_dir/systemprocesses.sh $dist

rm $HOME/init.sh &&  echo "$timestamp removed install script" >> $log

sudo $autor autoremove -y && echo "$timestamp Post install clean up" >> $log
echo "$timestamp Finished installing" >> $log && echo "Finished installing"
read -r -p "Reboot now [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	sudo shutdown -r now
else
	exit
fi
