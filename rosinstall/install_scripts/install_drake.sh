#!/bin/bash

echo "Current directory is"
echo $PWD

echo "Install Drake distribution and dependencies ..."

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd $THIS_DIR/../..; pwd)

DRAKE_BASE_DIR="${ROOT_DIR}/src/external"
DRAKE_DIR="${DRAKE_BASE_DIR}/drake-distro"
cd ${DRAKE_BASE_DIR}

MATLAB_LINK=$(which matlab)

if [ -z $MATLAB_LINK ]
then
  echo "No MATLAB installation found..."
else
  # Find MATLAB path and create base dirs
  MATLAB_EXECUTABLE=$(readlink "$MATLAB_LINK")
  MATLAB_ROOT="$(dirname "$MATLAB_EXECUTABLE")/.."
  MATLAB_ROOT=$(readlink -f $MATLAB_ROOT)
  echo "Found MATLAB installation: $MATLAB_ROOT"
fi



echo "Cloning Drake repositories ..."
rm -Rf drake-distro
git clone https://github.com/RobotLocomotion/drake.git drake-distro
cd drake-distro
make configure
cmake -C ${ROOT_DIR}/rosinstall/install_scripts/helper/drake_cmake_cache.txt pod-build   
make download-all

echo "Installing dependencies ..."
sudo apt-get update
sudo ./install_prereqs.sh ubuntu

echo "Building Drake distro"
patch drake/solvers/NonlinearProgramSnoptmex.cpp < ${ROOT_DIR}/rosinstall/install_scripts/helper/drake_snopt.patch

git checkout master
git pull

cd externals/director
git checkout master
git pull
cd ../..

read -p "Press [Enter] key to start make..."

BUILD_PREFIX="`pwd`/build" make
unset BUILD_PREFIX
cd ..

if [ -z ${MATLAB_ROOT} ] 
then
  echo "Setting up MATLAB paths not required"
else
  echo "Setting up MATLAB paths"
  if ( ! [ -a "${MATLAB_ROOT}/toolbox/local/setup_drake_paths.m" ] ) 
  then
    echo ''                                 | sudo tee --append $MATLAB_ROOT/toolbox/local/matlabrc.m > /dev/null
    echo '% Add drake paths to environment' | sudo tee --append $MATLAB_ROOT/toolbox/local/matlabrc.m > /dev/null
    echo 'setup_drake_paths'                | sudo tee --append $MATLAB_ROOT/toolbox/local/matlabrc.m > /dev/null
  fi
  sudo cp ${ROOT_DIR}/rosinstall/install_scripts/helper/setup_drake_paths.m $MATLAB_ROOT/toolbox/local
fi

# keep THOR catkin from interfering
touch $DRAKE_DIR/CATKIN_IGNORE

echo "Done installing Drake components ...!"

