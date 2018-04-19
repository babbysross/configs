#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get update -y && apt-get upgrade -y
apt-get install -my guake terminator neovim emacs zsh i3lock ntpdate gparted exfat-fuse exfat-utils neofetch
ntpdate uk.pool.ntp.org
mkdir /tmp/deleteme && cd /tmp/deleteme
wget -P /tmp/deleteme https://pcaro.es/d/otf-hermit-1.21.tar.gz
tar -xvf /tmp/deleteme/otf-hermit-1.21.tar.gz 
cp Hermit-bold.otf /usr/share/fonts/truetype/
cp Hermit-light.otf /usr/share/fonts/truetype/
cp Hermit-medium.otf /usr/share/fonts/truetype/
cd ~ && rm -rf /tmp/deleteme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
curl -sLf https://spacevim.org/install.sh | bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/babbysross/configs ~/Projects/configs && cd ~/Projects/configs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/Projects/configs/.zshrc ~/.zshrc
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
cp ~/Projects/configs/wallpapers/PiBackgroundITER.png /usr/share/rpd-wallpaper/
sed -i 's/cliff.jpg/PiBackgroundITER.png/g' ~/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
cp ~/Projects/configs/wallpapers/Stars-at-night.png ~/Pictures
