#!/bin/bash

echo "################### WELCOME TO SOFTWARE INSTALLATION SCRIPT #########################"

# Install Pacman Stuff
sudo pacman -S --noconfirm jdk-openjdk chromium ranger qbittorrent vlc telegram-desktop shotwell

# Install AUR Stuff
yay -S --noconfirm visual-studio-code-bin pamac-aur xdman spotify-dev android-studio

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
