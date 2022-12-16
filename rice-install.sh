#!/bin/bash

# An automated script to install a coding rice and theme in Openbox Arch-Based Distros
# (original setup is from https://github.com/weigert/.dotfiles)
# Thank you so much Weigert!

reset=$(tput sgr0)
highlight=$(tput setaf 6)
sourceIt() { echo "./$1"; source "$1"; }

checkBackup() {
	if [ -d ~/.config/"$1" ]
	then
		if [ -d ~/.config/"$1"-bak ]
		then
			rm -rfv ~/.config/"$1"-bak
		fi
		\cp -rv ~/.config/"$1" ~/.config/"$1"-bak
		rm -rfv ~/.config/"$1"
	fi
}

echo "${highlight}Ensure you have xorg, openbox and others installed."
echo "For more info about the packages look inside the script.${reset}"
# The packages you should already have installed are:
# 'xorg-server xorg-drivers xorg-xinit rxvt-unicode openbox obconf yay git'
# and maybe 'lightdm' with at least 'lightdm-gtk-greeter' or other DM

sleep 2

echo "${highlight}Installing fonts for improved legibility${reset}"

yay -S nerd-fonts-noto-sans-mono ttf-comfortaa siji-git ttf-unifont --needed \
 --noconfirm

sourceIt ttf-impallari-dosis.sh

printf "\n${highlight}Installing the programs${reset}\n\n"

yay -S oblogout gnome-terminal-transparency polybar lxsession-gtk3 --needed \
 --noconfirm
sudo pacman -S feh rofi dmenu nautilus firefox zathura vlc mpv exo xcape vte3 \
 xdg-user-dirs-gtk base-devel vte-common libvterm libconfig --needed --noconfirm

curl -Ls https://raw.githubusercontent.com/Firespindash/spectrwm-config/main/compton.sh \
 -o compton.sh
chmod +x compton.sh
sourceIt compton.sh

printf "\n${highlight}Improving font rendering${reset}\n\n"
# Font rendering in Manjaro is improved by default
# For more steps and for advanced configurations see Arch Wiki and the README.md

[ ! -d ~/.config/fontconfig ] && mkdir ~/.config/fontconfig

[ -f ~/.config/fontconfig/fonts.conf ] && mv -v ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.bak

cp -v fontconf ~/.config/fontconfig/fonts.conf
sudo cp -v fontconf /etc/fonts/local.conf

[ -f ~/.Xresources ] && mv -v ~/.Xresources ~/.Xresources.bak

cp -v resources ~/.Xresources

xrdb -merge ~/.Xresources

printf "\n${highlight}Downloading configurations${reset}\n\n"

git clone https://github.com/weigert/.dotfiles

# Wallpaper
[ ! -f ~/.config/solid.png ] && cp -v .dotfiles/solid.png ~/.config/

feh --bg-fill ~/.config/solid.png

echo '#!/bin/sh' > ~/.config/.fehbg
echo "'feh' '--bg-fill' '.config/solid.png'" >> ~/.config/.fehbg
chmod +x ~/.config/.fehbg

# Rofi Menu
checkBackup rofi

sed -i '/theme:/d' .dotfiles/rofi/config.rasi
sed -i 's/}/}\n\n@theme "theme.rasi"/g' .dotfiles/rofi/config.rasi

cp -rv .dotfiles/rofi ~/.config/rofi

# Polybar
checkBackup polybar

cp -rv polybar ~/.config/

# Compton Compositor with Blur Support
[ -f ~/.config/compton.conf ] && \
 mv -v ~/.config/compton.conf ~/.config/compton.conf.bak

cp -v compton.conf ~/.config/

# Openbox Theme and Configurations
sudo cp -rv .dotfiles/usr/share/themes/Rice/ /usr/share/themes/

cp -v menu.xml .dotfiles/openbox/
\cp -v rc.xml .dotfiles/openbox/
\cp -v autostart .dotfiles/openbox/
cp -v environment .dotfiles/openbox/

checkBackup openbox

cp -rv .dotfiles/openbox ~/.config/

# Terminal Configuration
dconf load /org/gnome/terminal/ < term-backup

rm -rf .dotfiles compton.sh
