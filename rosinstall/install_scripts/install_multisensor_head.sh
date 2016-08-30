#!/bin/bash

#cd $THOR_ROOT

#!/bin/bash

# This should be extended to first check if everything is installed and only do the sudo requiring call when there's anything missing.
echo "Installing needed packages (both ROS package and system dependency .deb packages) ..."

PACKAGES_TO_INSTALL="\
ros-$ROS_DISTRO-dynamixel-msgs \
ros-$ROS_DISTRO-openni2-camera \
ros-$ROS_DISTRO-openni2-launch \
ros-$ROS_DISTRO-dynamixel-controllers "



sudo apt-get -y install $PACKAGES_TO_INSTALL



if [ -z $THOR_ROOT ]; then
  echo "Variable THOR_ROOT not set, make sure the workspace is set up properly!"
else
  echo "Installing multisensor head software..."
  
  cd $THOR_ROOT
  
  # Common pkgs
  wstool merge rosinstall/optional/multisensor_head.rosinstall
 
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
