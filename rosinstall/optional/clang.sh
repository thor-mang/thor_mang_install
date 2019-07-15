#!/bin/bash

source $ROSWSS_BASE_SCRIPTS/helper/helper.sh

# replace standard install of clang with version 8
apt_remove clang-format
apt_install clang-format-8

# create symlink
cd /usr/bin
if [ ! -f clang-format ]; then
  sudo ln -s clang-format-8 clang-format
fi

# copy clang file
cd $ROSWSS_ROOT/src
if [ ! -f .clang-format ]; then
  ln -s ../.clang-format .clang-format
fi
