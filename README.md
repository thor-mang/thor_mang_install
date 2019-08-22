# thor_mang_install
Provides rosinstall files and scripts for making installation of thor_mang software more convenient.

## Basic Desktop/Laptop Install

General remarks:

*The standard computer setup we use is Ubuntu 18.04/64Bit*
* Note that other setups might work, but cannot be supported due to the overhead that would involve.
* Install ROS Melodic as described here: http://wiki.ros.org/melodic/Installation/Ubuntu

Choose the desktop variant:
<pre>
sudo apt-get install ros-melodic-desktop
</pre>

Checkout software (please take note of the . at the end):
<pre>
mkdir ~/thor
cd ~/thor
git clone https://github.com/thor-mang/thor_mang_install.git .
</pre>

Install software:
<pre>
./install.sh
</pre>

Add following line to your .bashrc:
<pre>
. ~/thor/setup.bash
</pre>

Open a new terminal before starting to work on THORMANG software.

## Install Gazebo Simulation

For simulation you need to install following rosinstalls:
<pre>
thor install simulation ui
thor update_make
</pre>

## Running in Simulation

Start default simulation environment
<pre>
thor sim
</pre>

Open demo interface
<pre>
thor ui demo.launch
</pre>
