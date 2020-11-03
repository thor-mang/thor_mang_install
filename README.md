# thor_mang_install
Provides rosinstall files and scripts for making installation of thor_mang software more convenient.

## Basic Desktop/Laptop Install

General remarks:

*The standard computer setup we use is Ubuntu 18.04/64Bit with ROS Melodic*
* Note that other setups might work, but cannot be supported due to the overhead that would involve.
* The scripts require a working ssh-key setup for git.sim.informatik.tu-darmstadt.de and the key has to be added to the ssh-agent ([further deails](https://kamarada.github.io/en/2019/07/14/using-git-with-ssh-keys/#.X3WaLpqxWV5))

Checkout software (please take note of the . at the end):
<pre>
mkdir ~/thor
cd ~/thor
git clone https://github.com/thor-mang/thor_mang_install.git .
</pre>

If not already done, *install ROS Melodic* using the setup script, which is based on the official [tutorial](http://wiki.ros.org/melodic/Installation/Ubuntu) (using desktop variant):
<pre>
./install_melodic.sh
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
