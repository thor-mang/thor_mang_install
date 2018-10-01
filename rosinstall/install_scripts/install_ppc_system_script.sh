#!/bin/bash

echo "WARNING: You are going to overwrite system settings! This operation cannot be undone!"
echo -n "ARE YOU SURE TO PROCEED? [y/N]"
read -N 1 REPLY
echo

if [[ "$REPLY" = "y" || "$REPLY" = "Y" ]]; then
  cd /
  if [ ! -d /.git ]; then
    echo ">>> Install system configs"
    # remove default config files
    sudo mv etc/network/interfaces etc/network/interfaces.bak
    sudo mv etc/screenrc etc/screenrc.bak

    # fetch replacement configuration files stored in git repo
    sudo git init
    sudo git remote add origin https://github.com/thor-mang/system_ppc_ubuntu.git
    sudo git fetch
    sudo git checkout -t origin/master
  fi

  # add thor user to dialout
  sudo usermod -aG dialout thor 

  # checkout robot packages
  echo ">>> Install packages:"
  bash -ic "thor install perception"
  bash -ic "thor update_make"

  # enable systemd init script
  echo ">>> setup autostart"
  sudo systemctl enable thor.service
  # if desired to check if successfull -> "sudo systemctl is-enabled thor.service" should return "enabled"

  # enable shutdown and reboot without root password promt
  echo 'thor ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' | sudo EDITOR='tee -a' visudo

  echo ">>> install realsense"
  sudo apt-get install ros-kinetic-realsense-camera
  
  echo "Installation completed! Please reboot system now."
else
  echo ">>> Install cancelled by user."
  exit 0
fi
