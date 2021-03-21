#!/bin/bash

# Updates the repositories and packages
sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt autoclean

# Install Pip3
sudo apt install python3-pip

# Git configuration
git config --global user.email "yatishbhardwaj1@gmail.com"
git config --global user.name "Yatish Bhardwaj"
git config --global credential.helper store

# Gnome-tweaks
sudo apt install gnome-tweaks

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

