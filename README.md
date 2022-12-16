# coding-rice-installer
A script to install a light theme for coding in _Openbox Arch_-Based Distros.

![openbox_theme](openbox-customization.png)

The original theme and setup is from [Weigert dotfiles](https://github.com/weigert/.dotfiles), I just added some improvements.

## Installation
* Clone it and go to the terminal;
* type `cd coding-rice-installer`; 
* and run `./rice-install.sh`;
* then log out and log in again.

## Recommendations
Choose your text editors, _xed_ and other _xapps_ aren't installed by default and _atom_ isn't supported anymore. After you make your choice, change the *menu.xml* file entries for these editors with yours. \
I recommend to you to configure the terminal to have 132-columns and 27-lines. I also recommend to set the fonts of the applications to one of the new fonts the script installs, and if you know others, install other fonts you would like to use. If you still want better font configuration and rendering I recommend to install the [freetype2-ultimate5](https://aur.archlinux.org/packages/freetype2-ultimate5/) package.

## Extras
The script improves font rendering and it comes with other fonts for better reading, by default. The color of the bar in the bottom is set to transparent, it can be used with other wallpapers if you want to, you just have to change the text color depending on the wallpaper, to have a better reading. And if you use battery, you can activate the battery module for the bar inside *polybar/config.ini* file. \
If you use other keyboard layout, not the US one, you will have to add in the *autostart* file the command `setxkbmap xx`, with `xx` being the two-letters abbreviation of your keyboard layout language, you can also add variants with the `-variant` flag. \
And if you have any issue when installing on _Arch_ or other _Arch_-based systems, there are some packages that come pre-installed on _Manjaro_ that you should already have installed, to see which packages it could be, see inside the script. \
\
Another image with the two main code editors (_xed_ and _atom_).

![coding_apps](coding-rice.png)
