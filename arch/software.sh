#!/bin/bash

echo "################### WELCOME TO SOFTWARE INSTALLATION SCRIPT #########################"

# Install PACMAN Modules
sudo pacman -S --noconfirm ranger code qbittorrent vlc telegram-desktop gnome-tweaks chrome-gnome-shell

# Install AUR Modules
yay -S --noconfirm google-chrome teams pamac-aur

# Install Kodi
sudo pacman -S --noconfirm kodi kodi-x11 kodi-addon-inputstream-adaptive

# Install Transparent GNome terminal
yay -S --needed  gnome-terminal-transparency

#Shotwell
sudo pacman -S --noconfirm shotwell obs-studio

# Download Pling Store
wget https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1NzM1MDc2NzQiLCJ1IjpudWxsLCJsdCI6ImZpbGVwcmV2aWV3IiwicyI6ImE3MjRiNmQxMDAxNmJmMzk4MmFjYmQwODQwNmE5ZTM1OGIyMzdmNGI3ZGExMjU2ZDNiODViMWQ2NzEyMDNjNDM2YjI5MGE5NTc3MzAxZjYwNDEyMzZmOWU3NGYwOTJhZTExYzc2ZGY3MmExOTYzNWM0NTE0MjIzZjkyNTI3YjZiIiwidCI6MTU5ODUyMDQwMSwic3RmcCI6IjgwZTBlMDgzMDlmZDQwMDcxMmMyY2JlMWJhZjllNjdjIiwic3RpcCI6IjExNy45OS4xNjMuMTQifQ.EwU8SEsxyW2iWUM-CbAoMsDONExsqK0cGumbdn4pNyc/pling-store-5.0.2-1-x86_64.AppImage -O $HOME/Downloads

# Spotify
sudo pacman -S --noconfirm gtk-engine-murrine
yay -S --noconfirm --needed spotify-dev

#Wireguard VPN
sudo pacman -S --noconfirm wireguard-tools

#Office
yay -S --noconfirm --needed softmaker-office-2021-bin

# Install ZSH
sudo pacman -S zsh zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-theme-powerlevel10k  --noconfirm
sudo cp .zshrc /home/$USER
chsh -s /bin/zsh

echo "Do you want to install VMware? (y/n)"
read -r install_choice
if ["$install_choice" = "y"]; then
     yay -S --noconfirm --needed  vmware-workstation
     sudo systemctl enable vmware-networks.service  vmware-usbarbitrator.service vmware-hostd.service
     sudo systemctl start vmware-networks.service  vmware-usbarbitrator.service vmware-hostd.service
     sudo systemctl status vmware-networks.service  vmware-usbarbitrator.service vmware-hostd.service
     sudo modprobe -a vmw_vmci vmmon
else
     echo "VMware not installing"
fi

echo "INSTALLATION SUCCESSFULL!"
