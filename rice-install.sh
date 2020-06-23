#!/bin/bash

# An automated script to install a coding rice and theme in Openbox Manjaro
# (original setup is from https://github.com/weigert/.dotfiles)
# Thank you so much Weigert!

reset=$(tput sgr0)
highlight=$(tput setaf 6)

echo "${highlight}Ensure you have xorg, openbox and others installed."
echo "For more info about the packages look inside the script.${reset}"
# The packages you should have are 'xorg-server xorg-drivers xorg-xinit
# rxvt-unicode linux-firmware arandr openbox obconf yay git'
# and maybe 'lightdm' with at least 'lightdm-gtk-greeter'

sleep 1

echo "${highlight}Installing fonts for improve legibility${reset}"

yay -S nerd-fonts-noto-sans-mono ttf-comfortaa ttf-impallari-dosis siji-git ttf-unifont --noconfirm

printf "\n${highlight}Installing the programs${reset}\n\n"

yay -S compton-tryone-git oblogout gnome-terminal-transparency --noconfirm
sudo pacman -S feh rofi dmenu polybar nautilus firefox zathura atom vlc mpv --noconfirm

printf "\n${highlight}Improving font rendering${reset}\n\n"
# Font rendering in Manjaro is already improved by default
# For more steps and for advanced configurations see Arch Wiki

if [ ! -d ~/.config/fontconfig ]
then
	mkdir ~/.config/fontconfig
fi

if [ -f ~/.config/fontconfig/fonts.conf ]
then
	mv ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.bak
fi

cp fontconf ~/.config/fontconfig/fonts.conf
sudo cp fontconf /etc/fonts/local.conf

if [ -f ~/.Xresources ]
then
	mv ~/.Xresources ~/.Xresources.bak
fi

cp resources ~/.Xresources

xrdb -merge ~/.Xresources

printf "\n${highlight}Downloading configuration${reset}\n\n"

git clone https://github.com/weigert/.dotfiles

# Wallpaper
if [ ! -f ~/.config/solid.png ]
then
	cp .dotfiles/solid.png ~/.config/
fi

feh --bg-fill ~/.config/solid.png

# Rofi Menu
cp .dotfiles/.fehbg ~/.config/

cp -r .dotfiles/rofi ~/.config/rofi

# Polybar
if [ -d ~/.config/polybar ]
then
	if [ -d ~/.config/polybar-bak ]
	then
		rm -rf ~/.config/polybar-bak
	fi
	\cp -r ~/.config/polybar ~/.config/polybar-bak
	rm -rf ~/.config/polybar
fi

cp -r polybar ~/.config/

# Compton Compositor with Blur Support

if [ -f ~/.config/compton.conf ]
then
	mv ~/.config/compton.conf ~/.config/compton.conf.bak
fi

cp compton.conf ~/.config/

# Openbox Theme and Configurations

sudo cp -r .dotfiles/usr/share/themes/Rice/ /usr/share/themes/

cp menu.xml	.dotfiles/openbox/
\cp rc.xml .dotfiles/openbox/
\cp autostart .dotfiles/openbox/
cp environment .dotfiles/openbox/

if [ -d ~/.config/openbox ]
then
	if [ -d ~/.config/openbox-bak ]
	then
		rm -rf ~/.config/openbox-bak
	fi
	cp -r ~/.config/openbox ~/.config/openbox-bak
	rm -rf ~/.config/openbox
fi

cp -r .dotfiles/openbox ~/.config/

rm -rf .dotfiles
