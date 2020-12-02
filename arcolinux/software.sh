#!/bin/bash

echo "################### WELCOME TO SOFTWARE INSTALLATION SCRIPT #########################"

#Shotwell
sudo pacman -S --noconfirm shotwell

# Install ZSH
sudo pacman -S zsh-history-substring-search zsh-autosuggestions  --noconfirm
tozsh

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
