#!/bin/bash

echo "Installing AptX and other proprietary bluetooth codecs"

sudo add-apt-repository ppa:eh5/pulseaudio-a2dp
echo "Replace focal/eoan with disco"
sudo nano /etc/apt/sources.list.d/eh5-ubuntu-pulseaudio-a2dp-focal.list
sudo apt update
sudo apt -assume-yes install pulseaudio libavcodec58 libldac pulseaudio-modules-bt
sudo apt --assume-yes install pulseaudio libavcodec58 libldac pulseaudio-modules-bt libbluetooth-dev libsbc-dev libpulse-dev git virtualenv build-essential python3-dev libdbus-glib-1-dev
sudo apt --assume-yes install pulseaudio libavcodec58 libldac pulseaudio-modules-bt libbluetooth-dev libsbc-dev libpulse-dev git virtualenv build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev pkg-config libtool sbc-tools libtool pkg-config libtool sbc-tools libtool cmake
sudo apt --assume-yes install libavcodec-dev libfdk-aac-dev libldac-dev libavutil-dev
git clone https://github.com/EHfive/pulseaudio-modules-bt.git
cd pulseaudio-modules-bt/
git submodule update --init
cd pa/
git fetch
git checkout v`pkg-config libpulse --modversion|sed 's/[^0-9.]*\([0-9.]*\).*/\1/'`
cd ..
mkdir build
cd build/
cmake ..
make
sudo make install
pulseaudio -k
pulseaudio --start
