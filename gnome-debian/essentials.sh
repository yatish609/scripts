#!/bin/bash

# Updates the repositories and packages
sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt autoclean

# Install Pip3
sudo apt install python3-pip

# Pulseaudio improvements
sudo sed -i 's/default-sample-format = s16le/default-sample-format = float32le/g' /etc/pulse/daemon.conf
sudo sed -i 's/resample-method = speex-float-1/resample-method = soxr-vhq/g' /etc/pulse/daemon.conf
sudo sed -i 's/realtime-priority = 5/realtime-priority = 9/g' /etc/pulse/daemon.conf
sudo sed -i 's/default-sample-rate = 44100/default-sample-rate = 48000/g' /etc/pulse/daemon.conf
sudo sed -i 's/alternate-sample-rate = 48000/alternate-sample-rate = 44100/g' /etc/pulse/daemon.conf

# Git configuration
git config --global user.email "yatishbhardwaj1@gmail.com"
git config --global user.name "Yatish Bhardwaj"
git config --global credential.helper store

# Gnome-tweaks and audio/video codecs with DRM and Widevine
sudo apt install gnome-tweaks, ubuntu-restricted-extras

# Installs AptX, LDAC and other proprietary bluetooth codecs
sudo add-apt-repository ppa:berglh/pulseaudio-a2dp
sudo apt update
sudo apt install pulseaudio-modules-bt libldac

echo "################# SOFTWARE ####################"

echo "Do you want to install required software? (y/n)"
read -r install_choice

if ["$install_choice" = "y"]; then
     bash software.sh
else
     echo "Optionals not installed"
     echo "Setup exiting"
     echo "Thank you for installing! Script by Yatish"
fi
