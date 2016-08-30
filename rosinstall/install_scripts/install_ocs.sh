#!/bin/bash

#cd $THOR_ROOT

if [ -z $THOR_ROOT ]; then
  echo "Variable THOR_ROOT not set, make sure the workspace is set up properly!"
else
  echo "Installing ocs software..."
  
  cd $THOR_ROOT
  
  # Common pkgs
  wstool merge rosinstall/optional/common_msgs.rosinstall
  wstool merge rosinstall/optional/utilities.rosinstall
  wstool merge rosinstall/optional/biped_state_estimator.rosinstall
#  wstool merge rosinstall/optional/launch.rosinstall
  
  # Manipulation planning
#  wstool merge rosinstall/optional/moveit.rosinstall
  wstool merge rosinstall/optional/moveit_planning.rosinstall
  wstool merge rosinstall/optional/manipulation_planning.rosinstall  
  wstool merge rosinstall/optional/object_templates.rosinstall
    
  # Perception, footstep planning
  wstool merge rosinstall/optional/perception.rosinstall
  wstool merge rosinstall/optional/footstep_planning.rosinstall  

  # Perception, footstep planning
#  wstool merge rosinstall/optional/vt_hands_controller.rosinstall

  # Common pkgs
  wstool merge rosinstall/optional/thormang3_ocs.rosinstall
#  wstool merge rosinstall/optional/behavior_control.rosinstall
 
  # Optionally check if update is requested. Not doing update saves some
  # time when called from other scripts
  while [ -n "$1" ]; do
    case $1 in
    --no_ws_update)
        UPDATE_WORKSPACE=1
        ;;
    esac

    shift
  done
  
  if [ -n "$UPDATE_WORKSPACE" ]; then
    echo "Not updating workspace as --no_ws_update was set"    
  else 
    wstool update
    rosdep update
    rosdep install -r --from-path . --ignore-src
  fi 
  
fi
