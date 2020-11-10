sudo pacman -Rns gdm libgdm
yay -S gdm-prime libgdm-prime

sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf

echo "Optimus config successfull"
