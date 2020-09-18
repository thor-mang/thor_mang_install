#!/bin/bash

source $ROSWSS_BASE_SCRIPTS/helper/helper.sh

if [[ "$1" == "install" ]]; then
  # replace standard install of clang with version 8
  apt_remove clang-format
  apt_install clang-format-8 clang-tidy

  # create symlinks
  cd /usr/bin
  if [ ! -f clang-format ]; then
    sudo ln -s clang-format-8 clang-format
  fi

  cd $ROSWSS_ROOT/src
  if [ ! -f .clang-format ]; then
    ln -s ../.clang-format .clang-format
  fi
fi

if [[ "$1" == "uninstall" ]]; then
  rm $ROSWSS_ROOT/src/.clang-format
fi
