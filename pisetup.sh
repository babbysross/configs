#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "doosan" | passwd pi --stdin
apt-get update && apt-get upgrade
apt-get install -my guake terminator neovim emacs zsh zsh-syntax-highlighting i3lock ntpdate gparted
ntpdate uk.pool.ntp.org
mkdir /tmp/deleteme && cd /tmp/deleteme
wget -P /tmp/deleteme https://pcaro.es/d/otf-hermit-1.21.tar.gz
tar -xvf /tmp/deleteme/otf-hermit-1.21.tar.gz 
cp Hermit-bold.otf /usr/share/fonts/truetype/
cp Hermit-light.otf /usr/share/fonts/truetype/
cp Hermit-medium.otf /usr/share/fonts/truetype/
cd ~ && rm -rf /tmp/deleteme
curl -sLf https://spacevim.org/install.sh | bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/babbysross/configs ~/Projects/configs && cd ~/Projects/configs
cp ~/Projects/configs/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"