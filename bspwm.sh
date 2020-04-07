#!/bin/sh


repo="$HOME/repositories"
shell="sh"
polybar="git@github.com:polybar/polybar.git"
bspwm="git@github.com:baskerville/bspwm.git"
sxhkd="git@github.com:baskerville/sxhkd.git"

########################
# POLYBAR INSTALLATION #
########################

sudo apt install \
  cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
  libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen \
  xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev \
  libiw-dev libcurl4-openssl-dev libpulse-dev \
  libxcb-composite0-dev xcb libxcb-ewmh2

cd "$repo" || return
git clone "$polybar"
cd "$repo/$(echo "$polybar" | sed "s/.*\///;s/\..*//")" || return
latest="$(git describe --tags $(git rev-list --tags --max-count=1))"
git checkout -b "$latest"
"$shell" build.sh

########################
#  BSPWM INSTALLATION  #
########################

cd "$repo" || return
git clone "$bspwm"
cd "$repo/$(echo "$bspwm" | sed "s/.*\///;s/\..*//")" || return

########################
#  SXHKD INSTALLATION  #
########################

cd "$repo" || return
git clone "$sxhkd"
cd "$repo/$(echo "$sxhkd" | sed "s/.*\///;s/\..*//")" || return
