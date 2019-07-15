#!/bin/bash

depends world_model

apt_install ros-$ROS_DISTRO-gazebo-ros ros-$ROS_DISTRO-gazebo-ros-control ros-$ROS_DISTRO-gazebo-plugins
