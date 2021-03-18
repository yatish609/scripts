#!/bin/bash

echo "################### WELCOME TO SOFTWARE INSTALLATION SCRIPT #########################"

# Install Pacman Stuff
sudo pacman -S --noconfirm ranger shotwell

# Install AUR Stuff
yay -S --noconfirm google-chrome visual-studio-code-bin xdman

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
