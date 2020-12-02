#!/bin/bash

echo "################### WELCOME TO SOFTWARE INSTALLATION SCRIPT #########################"

# Install PACMAN Modules
sudo pacman -S --noconfirm ranger qbittorrent vlc telegram-desktop gnome-tweaks chrome-gnome-shell

# Install AUR Modules
yay -S --noconfirm brave-bin visual-studio-code-bin teams pamac-aur

#Shotwell
sudo pacman -S --noconfirm shotwell

# Spotify
sudo pacman -S --noconfirm gtk-engine-murrine
yay -S --noconfirm --needed spotify-dev

# Install ZSH
sudo pacman -S zsh zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-theme-powerlevel10k  --noconfirm
sudo cp .zshrc /home/$USER
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
