#!/bin/bash

apt_install ros-$ROS_DISTRO-grid-map-core ros-$ROS_DISTRO-grid-map-msgs ros-$ROS_DISTRO-grid-map-ros

echo "Merging rosinstall dependencies into workspace:"
ros_install common/vigir_pluginlib.rosinstall common/chisel.rosinstall
