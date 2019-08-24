#!/bin/bash

# definning path to local repo dir
basedir=$HOME/repositories
# defining path to script dir
script_dir=$basedir/scripts

source $script_dir/config

sudo start tlp && echo "$timestamp started tlp" >> $log
sudo echo "vm.swapiness = 10" >> /etc/sysctl.conf  && echo "$timestamp swapiness = 10" >> $log 
sudo systemctl enable syncthing@$USER.service  && echo "$timestamp started syncthing@$USER.service" >> $log

if [ $1 == "mageia" ]
then 
    echo "if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then" >> $HOME/.bashrc
    echo "exec tmux" >> $HOME/.bashrc
    echo "fi" && echo "$timestamp added tmux autostart to .bashrc" >> $log
    echo "tmux source-file $HOME/.tmux.conf" >> $HOME/.bashrc  && echo "$timestamp adding sourcing of .tmux.conf to .bashrc" >> $log
    echo "source $HOME/.ssh/ssh_alias" >> $HOME/.bashrc && echo "$timestamp added ssh_alias to .bashrc" >> $log
    echo "if [ -f ~/.bash_aliases ]; then" >> $HOME/.bashrc 
    echo ". ~/.bash_aliases" >> $HOME/.bashrc 
    echo "fi" >> $HOME/.bashrc && echo "$timestamp added .bash_alias to .bashrc" >> $log
fi