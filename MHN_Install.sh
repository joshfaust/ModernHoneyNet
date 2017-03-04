#!/bin/bash

#======================================
# MHN Set-up Script: Ubuntu 14.04
# By: Joshua Faust
#======================================

# Start by setting up required services and Networking
echo ""
echo '--------------------------------------------'
echo '    Modern Honey Network Setup Script       '
echo '--------------------------------------------'
echo ""
if [ "$(whoami)" != "root" ]
	then
	echo -e "You need to be root, exiting the program."
	exit 1
fi
echo ""
echo -n 'Have you set-up a static IP? (y|n) '; read IP

if [ $IP == "n" ] || [ $IP == "N" ]
	then
	echo "Please set-up a Static IP before starting the install"
	exit 1
fi

apt-get update -y
apt-get upgrade -y
apt-get install git -y
cd /opt
git clone https://github.com/threatstream/mhn.git
cd /opt/mhn
./install.sh
echo '---------------------------------------------'
echo '      Git and MHN Installation Complete      '
echo '---------------------------------------------'
echo ""
echo '---------------------------------------------'
echo '            Checking MHN status              '
echo '---------------------------------------------'
/etc/init.d/nginx status
/etc/init.d/supervisor status
supervisorctl status


