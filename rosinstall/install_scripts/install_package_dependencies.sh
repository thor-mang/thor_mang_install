#!/bin/bash

# This should be extended to first check if everything is installed and only do the sudo requiring call when there's anything missing.
echo "Installing needed packages (both ROS package and system dependency .deb packages) ..."

PACKAGES_TO_INSTALL="\
mercurial \
git \
python-rosdep \
python-wstool \
ros-indigo-desktop \
ros-indigo-serial \
ros-indigo-hector-slam \
ros-indigo-hector-localization \
ros-indigo-map-server"

sudo apt-get -y install $PACKAGES_TO_INSTALL

