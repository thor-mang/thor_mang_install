#!/bin/bash

apt_install()
{
    PACKAGES_TO_INSTALL=$1
    dpkg -s $PACKAGES_TO_INSTALL &>/dev/null || sudo apt-get -y install $PACKAGES_TO_INSTALL
}

if [ -z "$ROSWSS_ROOT" ]; then
    ROSWSS_ROOT=$(cd `dirname $0`; pwd)
else
    cd $ROSWSS_ROOT
fi

# exit if one of the commands fail
#set -e

# install deb packages
echo ">>> Checking system packages"
apt_install python-rosdep python-wstool python-catkin-tools
echo

# delete old files
echo ">>> Cleaning up old workspace files..."
for f in .rosinstall* devel build install .catkin_tools; do
    [ -f $f ] && echo "rm -iv $f" && rm -i $f
    [ -d $f ] && echo "rm -Irv $f" && rm -Ir $f
done
echo

unset CMAKE_PREFIX_PATH

# find an installation of ROS
if [ -z "$ROS_DISTRO" ]; then
    _ROS_DISTROS="indigo jade kinetic lunar"

    # use basename of the current folder as default ROS distro
    ROS_DISTRO=$(basename $(cd `dirname $0`; pwd))
    for _distro in $_ROS_DISTROS ask; do
        if [ "$_distro" = "$ROS_DISTRO" ]; then break; fi
    done

    if [ "$_distro" = "ask" ]; then
        echo -n "Which ROS distro you want to setup this workspace for ($_ROS_DISTROS)?"
        read ROS_DISTRO
    fi

    if [ ! -r /opt/ros/$ROS_DISTRO/setup.sh ]; then
        echo "Directory /opt/ros/$ROS_DISTRO does not exists!"
        exit 1
    fi
fi

source /opt/ros/$ROS_DISTRO/setup.sh
echo

# initialize workspace
if [ ! -f ".rosinstall" ]; then
    wstool init .
elif [ ! -d ".catkin_tools" ]; then
    catkin init
fi

# running bash scripts from rosinstall/*.sh
echo ">>> Running bash scripts"
for file in $ROSWSS_ROOT/rosinstall/*.sh; do
    filename=$(basename ${file%.*})
    echo "Running bash script: '$filename'.sh"
    $file
    echo
done

# merge rosinstall files from rosinstall/*.rosinstall
for file in $ROSWSS_ROOT/rosinstall/*.rosinstall; do
    filename=$(basename ${file%.*})
    echo "Merging to workspace: '$filename'.rosinstall"
    wstool merge $file -y
done
echo

# update workspace
wstool update -j$(nproc)
echo

# install dependencies
rosdep update
rosdep install -r --from-path . --ignore-src

# remove symlink to write protected CMakefile and use a copy instead
if [ -f $ROSWSS_ROOT/src/CMakeLists.txt ]; then
  rm $ROSWSS_ROOT/src/CMakeLists.txt
fi
cp /opt/ros/$ROS_DISTRO/share/catkin/cmake/toplevel.cmake $ROSWSS_ROOT/src/CMakeLists.txt

echo

# generate top-level setup.bash
cat >setup.bash <<EOF
#!/bin/bash
# automated generated file
. $ROSWSS_ROOT/devel/setup.bash
EOF

# invoke make for the initial setup
#catkin_make cmake_check_build_system
export ROSWSS_SCRIPTS=$ROSWSS_ROOT/src/workspace_scripts/scripts
. $ROSWSS_SCRIPTS/make.sh
echo

# Initialization successful. Print message and exit.
cat <<EOF

===================================================================
Workspace initialization completed.
You can setup your current shell's environment by entering

    source $ROSWSS_ROOT/setup.bash

or by adding this command to your .bashrc file for automatic setup on each invocation of an interactive shell:

    echo "source $ROSWSS_ROOT/setup.bash" >> ~/.bashrc

You can also modify your workspace config (e.g. for adding additional repositories or
packages) using the wstool command.
===================================================================

EOF

