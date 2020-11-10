sudo rm /etc/X11/xorg.conf.d/90-mhwd.conf
sudo cp optimus.conf /etc/X11/xorg.conf.d/optimus.conf

# Refine blacklist
sudo rm /etc/modprobe.d/mhwd-gpu.conf
sudo cp nvidia.conf /etc/modprobe.d/nvidia.conf

sudo cp nvidia-drm.conf /etc/modprobe.d/nvidia-drm.conf
sudo cp optimus.desktop /usr/local/share/optimus.desktop
sudo ln -s /usr/local/share/optimus.desktop /usr/share/gdm/greeter/autostart/optimus.desktop
sudo ln -s /usr/local/share/optimus.desktop /etc/xdg/autostart/optimus.desktop
