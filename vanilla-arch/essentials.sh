#!/bin/bash

# Created by Yatish

echo "Installing for Arch"

echo "#################### APPLYING SYSTEM IMPROVEMENTS #####################"

sudo pacman -Syu # Sync mirrors and update packages

# Installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rf yay

# GPU and Prime Related Stuff
sudo pacman -S --noconfirm apparmor pkgfile vulkan-tools mesa-demos
sudo pkgfile --update

#Install pip
echo "Installing Pip3"
sudo pacman -S --noconfirm python-pip

#Install essential fonts
sudo pacman -S --noconfirm  noto-fonts-extra ttf-fira-sans ttf-fira-mono
yay -S --noconfirm --needed nerd-fonts-terminus nerd-fonts-hack

# Migrating to Pipewire
############################################
# Pulseaudio improvements
#sudo sed -i 's/default-sample-format = s16le/default-sample-format = float32le/g' /etc/pulse/daemon.conf
#sudo sed -i 's/resample-method = speex-float-1/resample-method = soxr-vhq/g' /etc/pulse/daemon.conf
#sudo sed -i 's/realtime-priority = 5/realtime-priority = 9/g' /etc/pulse/daemon.conf
#sudo sed -i 's/default-sample-rate = 44100/default-sample-rate = 48000/g' /etc/pulse/daemon.conf
#sudo sed -i 's/alternate-sample-rate = 48000/alternate-sample-rate = 44100/g' /etc/pulse/daemon.conf

#echo "Pulseaudio improvements successful!"
############################################

# Git config
git config --global user.email "yatishbhardwaj1@gmail.com"
git config --global user.name "Yatish Bhardwaj"
git config --global credential.helper store

#Printing
sudo pacman -S --noconfirm cups hplip

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
