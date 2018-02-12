#!/bin/bash

apt_install ros-$ROS_DISTRO-grid-map-core ros-$ROS_DISTRO-grid-map-msgs ros-$ROS_DISTRO-grid-map-ros
rosinstall common/vigir_pluginlib.rosinstall common/chisel.rosinstall common/mason.rosinstall
