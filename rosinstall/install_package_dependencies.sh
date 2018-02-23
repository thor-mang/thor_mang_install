#!/bin/bash

source $ROSWSS_BASE_SCRIPTS/helper/helper.sh

# This should be extended to first check if everything is installed and only do the sudo requiring call when there's anything missing.
echo "Installing needed packages (both ROS package and system dependency .deb packages) ..."

PACKAGES_TO_INSTALL="\
mercurial \
git \
libncurses5-dev \
libqt4-dev \
qt4-qmake \
python-rosdep \
python-wstool \
python-catkin-tools \
ros-$ROS_DISTRO-desktop \
ros-$ROS_DISTRO-rqt-multiplot \
ros-$ROS_DISTRO-serial \
ros-$ROS_DISTRO-hector-localization \
ros-$ROS_DISTRO-map-server \
ros-$ROS_DISTRO-image-pipeline \
ros-$ROS_DISTRO-octomap-msgs \
ros-$ROS_DISTRO-octomap-ros \
ros-$ROS_DISTRO-octomap-rviz-plugins \
ros-$ROS_DISTRO-ompl \
ros-$ROS_DISTRO-ros-control \
ros-$ROS_DISTRO-ros-controllers \
ros-$ROS_DISTRO-camera-info-manager \
ros-$ROS_DISTRO-urdfdom-py \
ros-$ROS_DISTRO-urg-node \
ros-$ROS_DISTRO-laser-filters \
ros-$ROS_DISTRO-pcl-ros \
ros-$ROS_DISTRO-theora-image-transport \
ros-$ROS_DISTRO-diagnostics \
ros-$ROS_DISTRO-qt-build \
ros-$ROS_DISTRO-humanoid-nav-msgs \
ros-$ROS_DISTRO-laser-assembler "

apt_install $PACKAGES_TO_INSTALL

echo "...DONE!"
