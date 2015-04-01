#!/bin/bash

# This should be extended to first check if everything is installed and only do the sudo requiring call when there's anything missing.
echo "Installing needed packages (both ROS package and system dependency .deb packages) ..."

PACKAGES_TO_INSTALL="\
mercurial \
git \
python-rosdep \
python-wstool \
ros-$ROS_DISTRO-desktop \
ros-$ROS_DISTRO-serial \
ros-$ROS_DISTRO-hector-slam \
ros-$ROS_DISTRO-hector-localization \
ros-$ROS_DISTRO-server"

sudo apt-get -y install $PACKAGES_TO_INSTALL

