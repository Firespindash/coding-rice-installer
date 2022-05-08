#!/bin/bash

curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-200ExtraLight.otf -o Dosis-v2031b-200ExtraLight.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-300Light.otf -o Dosis-v2031b-300Light.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-400Regular.otf -o Dosis-v2031b-400Regular.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-500Medium.otf -o Dosis-v2031b-500Medium.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-600SemiBold.otf -o Dosis-v2031b-600SemiBold.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-700Bold.otf -o Dosis-v2031b-700Bold.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/fonts/v2031b/Dosis-v2031b-800ExtraBold.otf -o Dosis-v2031b-800ExtraBold.otf
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/OFL.txt -o OFL.txt
curl -Ls https://raw.githubusercontent.com/impallari/Dosis/master/FONTLOG.txt -o FONTLOG.txt

sudo install -dm 755 "/usr/share/licenses/ttf-impallari-dosis"
sudo install -dm 755 "/usr/share/doc/ttf-impallari-dosis"
sudo install -dm 755 "/usr/local/share/fonts"
sudo install -dm 755 "/usr/local/share/fonts/otf"
sudo install -dm 755 "/usr/local/share/fonts/otf/Dosis"
sudo install -m 644 Dosis-v2031b-200ExtraLight.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-200ExtraLight.otf"
sudo install -m 644 Dosis-v2031b-300Light.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-300Light.otf"
sudo install -m 644 Dosis-v2031b-400Regular.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-400Regular.otf"
sudo install -m 644 Dosis-v2031b-500Medium.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-500Medium.otf"
sudo install -m 644 Dosis-v2031b-600SemiBold.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-600SemiBold.otf"
sudo install -m 644 Dosis-v2031b-700Bold.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-700Bold.otf"
sudo install -m 644 Dosis-v2031b-800ExtraBold.otf "/usr/local/share/fonts/otf/Dosis/Dosis-v2031b-800ExtraBold.otf"
sudo install -Dpm 644 OFL.txt "/usr/share/licenses/ttf-impallari-dosis/OFL.txt"
sudo install -Dpm 644 FONTLOG.txt "/usr/share/doc/ttf-impallari-dosis/FONTLOG.txt"

fc-cache

rm Dosis-* OFL.txt FONTLOG.txt
