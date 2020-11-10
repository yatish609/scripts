#!/bin/bash

#Install most apt-get stuff
sudo apt install ranger vlc telegram-desktop

#Install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install PyQt5 stuff
sudo apt install pyqt5-dev-tools qttools5-dev-tools
