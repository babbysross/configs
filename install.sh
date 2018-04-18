#!/bin/sh

apt-get update
apt-get upgrade
apt-get -my install steam guake terminator neovim blender kdenlive powertop stacer gimp darktable emacs zsh zsh-syntax-highlighting i3 i3-wm i3status ntpdate wine winetricks inkscape krita qbittorrent qjackctl gparted bleachbit
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.18/franz_5.0.0-beta.18_amd64.deb
dpkg -i franz_5.0.0-beta.18_amd64.deb

