#!/usr/bin/env bash

# For ARM64 arch add next
dpkg --add-architecture armhf

# add stretch repo to sources list
echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list

# update package list and install dependencies
apt-get update
apt-get install -y multiarch-support libssl1.0.0* git libportaudio2* libflac++6v5* libavahi-common3 libavahi-client3 alsa-utils

#more shared libraries for debian buster
echo "deb https://deb.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list

apt-get update
apt-get install -y libavformat57
apt-get install -y libcurl3

# create working folder
mkdir /usr/ifi
cd /usr/ifi

# clone git repo
git clone https://github.com/STUkh/ifi-tidal-release

# correct permissions
chmod +x /usr/ifi/ifi-tidal-release/play
chmod +x /usr/ifi/ifi-tidal-release/bin/tidal_connect_application
chmod +x /usr/ifi/ifi-tidal-release/pa_devs/run.sh

# deploy files
#./ifi-tidal-release/file-deploy.sh 

# start service and check on status
#systemctl daemon-reload
#systemctl start ifi-streamer-tidal-connect.service 
#systemctl status ifi-streamer-tidal-connect.service
