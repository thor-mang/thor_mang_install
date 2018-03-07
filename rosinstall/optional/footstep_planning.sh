#!/bin/bash

echo "Merging rosinstall dependencies into workspace:"
rosinstall common/vigir_pluginlib.rosinstall
rosinstall common/vigir_step_control.rosinstall
