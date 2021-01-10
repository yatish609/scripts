#!/bin/bash

echo "################### WELCOME TO SOFTWARE INSTALLATION SCRIPT #########################"

# Install Pacman Stuff
sudo pacman -S --noconfirm chromium ranger qbittorrent vlc telegram-desktop

# Install AUR Stuff
yay -S --noconfirm visual-studio-code-bin pamac-aur

#Shotwell
sudo pacman -S --noconfirm shotwell

# Spotify
sudo pacman -S --noconfirm gtk-engine-murrine
yay -S --noconfirm --needed spotify-dev

# Install ZSH
sudo cp .zshrc $HOME
chsh -s /bin/zsh

echo "Do you want to install Virt-manager? (y/n)"
read -r install_choice
if ["$install_choice" = "y"]; then
     sudo pacman -S virt-manager qemu vde2 libguestfs openbsd-netcat dnsmasq ebtables libvirt
     sudo systemctl enable libvirtd.service
     sudo systemctl start libvirtd.service
else
     echo "Virt-manager not installing"
fi

echo "SETUP COMPLETE!"
