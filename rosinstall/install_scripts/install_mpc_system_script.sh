#!/bin/bash

echo "WARNING: You are going to overwrite system settings! This operation cannot be undone!"
echo -n "ARE YOU SURE TO PROCEED? [y/N]"
read -N 1 REPLY
echo
if [[ ! ("$REPLY" = "y" || "$REPLY" = "Y") ]]; then

  echo ">>> Install cancelled by user."
  exit 0
fi

cd /

# remove default config files
sudo rm etc/network/interfaces
sudo rm etc/rc.local
sudo rm etc/screenrc

sudo git init
sudo git remote add origin https://github.com/thor-mang/system_mpc_ubuntu.git
sudo git fetch
sudo git checkout -t origin/master

echo "Installation completed! Please reboot system now."
