#!/bin/bash

source $ROSWSS_BASE_SCRIPTS/helper/helper.sh

apt_install clang-format

cd $ROSWSS_ROOT/src
if [ ! -f .clang-format ]; then
  ln -s ../.clang-format .clang-format
fi
