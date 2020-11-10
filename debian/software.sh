#!/bin/bash

#Install most apt-get stuff
sudo apt install ranger vlc telegram-desktop qbittorrent wine winetricks

#Install Brave
sudo apt install apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Install PyQt5 stuff
sudo apt install pyqt5-dev-tools qttools5-dev-tools