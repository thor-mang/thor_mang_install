#!/bin/bash

echo "Merging rosinstall dependencies into workspace:"
ros_install common/vigir_pluginlib.rosinstall
ros_install common/vigir_step_control.rosinstall
