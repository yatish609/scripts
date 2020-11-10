#!/bin/bash

# Created by Yatish

echo "Installing for Arch"

echo "#################### SYSTEM IMPROVEMENTS #####################"

# Copy Mirrorlist
sudo rm -rf /etc/pacman.d/mirrorlist
sudo cp mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syyu

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
sudo pacman -S --noconfirm ttf-droid ttf-bitstream-vera evolution-data-server ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-fira-sans ttf-fira-mono
yay -S --noconfirm --needed nerd-fonts-terminus nerd-fonts-hack

#Hardware Drivers
sudo pacman -S --noconfirm libva-utils intel-media-driver libva-intel-driver libva-mesa-driver

# Pulseaudio improvements
sudo sed -i 's/default-sample-format = s16le/default-sample-format = float32le/g' /etc/pulse/daemon.conf
sudo sed -i 's/resample-method = speex-float-1/resample-method = soxr-vhq/g' /etc/pulse/daemon.conf
sudo sed -i 's/realtime-priority = 5/realtime-priority = 9/g' /etc/pulse/daemon.conf
sudo sed -i 's/default-sample-rate = 44100/default-sample-rate = 48000/g' /etc/pulse/daemon.conf
sudo sed -i 's/alternate-sample-rate = 48000/alternate-sample-rate = 44100/g' /etc/pulse/daemon.conf

echo "Pulseaudio improvements successful!"

# Git config
git config --global user.email "yatishbhardwaj1@gmail.com"
git config --global user.name "Yatish Bhardwaj"
git config --global credential.helper store

# Keyserver
mkdir $HOME/.gnupg
sudo echo "keyserver pool.sks-keyservers.net" > $HOME/.gnupg/gpg.conf

#Printing
sudo pacman -S --noconfirm cups hplip
sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

#Pulseaudio Bluetooth Module
#sudo pacman -R pulseaudio-bluetooth    #This default module conflicts with the new module
yay -S pulseaudio-modules-bt

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
