#!/bin/bash

echo "WARNING: You are going to overwrite system settings! This operation cannot be undone!"
echo -n "ARE YOU SURE TO PROCEED? [y/N]"
read -N 1 REPLY

if [[ "$REPLY" = "y" || "$REPLY" = "Y" ]]; then
  cd /

  # remove default config files
  sudo mv etc/network/interfaces etc/network/interfaces.bak
  sudo mv etc/screenrc /etc/screenrc.bak

  sudo git init
  sudo git remote add origin https://github.com/thor-mang/system_ppc_ubuntu.git
  sudo git fetch
  sudo git checkout -t origin/master

  # add thor user to dialout
  sudo usermod -aG dialout thor 

  # checkout robot packages
  echo ">>> Install packages: perception manipulation_planning moveit_planning common_msgs object_templates vt_hands vt_hands_controller footstep_planning"
  bash -ic "thor install perception manipulation_planning moveit_planning common_msgs object_templates vt_hands vt_hands_controller footstep_planning"
  bash -ic "thor update_make"

  # enable systemd init script
  echo ">>> setup autostart"
  sudo systemctl enable turtle.service
  # if desired to check if successfull -> "sudo systemctl is-enabled turtle.service" should return "enabled"

  echo "Installation completed! Please reboot system now."
else
  echo ">>> Install cancelled by user."
  exit 0
fi
