#!/bin/bash


[ -z $1 ] && exit
if [ $1 == "neon" ];
then
		dist=$1
		sudo pkcon install git -y

elif [ $1 == "mageia" ];
then
		dist=$1
		sudo dnf install git ksshaskpass -y 
fi
# renamning and creating directories
[ -e  $HOME/Hämtningar ] && mv $HOME/Hämtningar $HOME/hämtningar
[ ! -e $HOME/nextcloud ] && mkdir $HOME/nextcloud
[ ! -e $HOME/projects ] && mkdir $HOME/projects
[ ! -e $HOME/virtualbox ] && mkdir $HOME/virtualbox
[ ! -e $HOME/tmp ] && mkdir $HOME/tmp
[ ! -e $HOME/repositories ] && mkdir $HOME/repositories
[ ! -e $HOME/repositories/build ] && mkdir $HOME/repositories/build
[ ! -e $HOME/bin ] && mkdir $HOME/bin
[ ! -e $HOME/.tmux ] && mkdir -p $HOME/.tmux/plugins/ 

# deleting directories
[ -e  $HOME/Bilder ] && rm -rf $HOME/Bilder
[ -e  $HOME/Dokument ] && rm -rf $HOME/Dokument
[ -e  $HOME/Mallar ] && rm -rf $HOME/Mallar
[ -e  $HOME/Musik ] && rm -rf $HOME/Musik
[ -e  $HOME/Publikt ] && rm -rf $HOME/Publikt
[ -e  $HOME/Desktop ] && rm -rf $HOME/Desktop
[ -e  $HOME/Skrivbord ] && rm -rf $HOME/Skrivbord
[ -e  $HOME/Video ] && rm -rf $HOME/Video

# defining shell
shell=bash
# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

cd $basedir
# 
SSH_ASKPASS=/usr/bin/ksshaskpass ssh-add < /dev/null

git clone git@github.com:gNusd/scripts.git
[ $dist == "neon"] && $shell $script_dir/ppa.sh
$shell $script_dir/packages.sh $dist 

git clone git@github.com:gNusd/dotfiles.git
cd $basedir/dotfiles/
$shell $script_dir/dotfile_install.sh $dist
cd $basedir

git clone git@github.com:gNusd/local-bin.git $HOME/bin

$shell $script_dir/tmux-nvim.sh
$shell $script_dir/native_tridactyl.sh
$shell $script_dir/git_repos.sh $dist

rm $HOME/init.sh
echo "Finished installing"
sleep 10
sudo shutdown -r now
