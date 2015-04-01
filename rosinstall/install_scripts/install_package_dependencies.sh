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
ros-$ROS_DISTRO-server
ros-$ROS_DISTRO-fcl \
ros-$ROS_DISTRO-image-pipeline \
ros-$ROS_DISTRO-octomap-msgs \
ros-$ROS_DISTRO-octomap-ros \
ros-$ROS_DISTRO-octomap-rviz-plugins \
ros-$ROS_DISTRO-ompl \
ros-$ROS_DISTRO-moveit-ros \
ros-$ROS_DISTRO-moveit-resources \
ros-$ROS_DISTRO-moveit-planners-ompl \
ros-$ROS_DISTRO-moveit-simple-controller-manager \
ros-$ROS_DISTRO-ros-control \
ros-$ROS_DISTRO-ros-controllers \
ros-$ROS_DISTRO-urdfdom-py"

sudo apt-get -y install $PACKAGES_TO_INSTALL

