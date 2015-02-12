#!/bin/bash

# This should be extended to first check if everything is installed and only do the sudo requiring call when there's anything missing.
echo "Installing needed packages (both ROS package and system dependency .deb packages) ..."

PACKAGES_TO_INSTALL="\
mercurial \
git \
python-rosdep \
python-wstool \
ros-hydro-desktop \
ros-hydro-serial \
ros-hydro-hector-slam \
ros-hydro-hector-localization \
ros-hydro-map-server"

sudo apt-get -y install $PACKAGES_TO_INSTALL

