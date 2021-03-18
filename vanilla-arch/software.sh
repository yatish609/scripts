#!/bin/bash

echo "################### EXECUTING SOFTWARE INSTALLATION SCRIPT #########################"

# Install Pacman Stuff
sudo pacman -S --noconfirm ranger shotwell

# Install AUR Stuff
yay -S --noconfirm google-chrome visual-studio-code-bin xdman

sudo pacman -S flatpak

echo "################### OPTIONALS ##############################"
echo "Do you want to install Virt-manager? (y/n)"
read -r install_choice

if ["$install_choice" = "y"]; then
     sudo pacman -S virt-manager qemu vde2 libguestfs openbsd-netcat dnsmasq ebtables libvirt
     sudo systemctl enable libvirtd.service
     sudo systemctl start libvirtd.service
else
     echo "Not installing Virt-manager"
fi

echo "SETUP COMPLETE!"
