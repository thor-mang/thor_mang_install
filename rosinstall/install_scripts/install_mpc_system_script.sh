#!/bin/bash

echo "WARNING: You are going to overwrite system settings! This operation cannot be undone!"
echo -n "ARE YOU SURE TO PROCEED? [y/N]"
read -N 1 REPLY

if [[ "$REPLY" = "y" || "$REPLY" = "Y" ]]; then
  cd /

  # remove default config files
  sudo mv etc/network/interfaces etc/network/interfaces.bak
  sudo mv etc/screenrc etc/screenrc.bak
  
  # fetch replacement configuration files stored in git repo
  sudo git init
  sudo git remote add origin https://github.com/thor-mang/system_mpc_ubuntu.git
  sudo git fetch
  sudo git checkout -t origin/master
  
  # add thor user to dialout
  sudo usermod -aG dialout thor 

  echo "Installation completed! Please reboot system now."
else
  echo ">>> Install cancelled by user."
  exit 0
fi
