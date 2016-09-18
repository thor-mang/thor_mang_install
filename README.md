# thor_mang_install
Provides rosinstall files and scripts for making installation of thor_mang software more convenient.

## Desktop/Laptop

General remarks:

*The standard computer setup we use is Ubuntu 14.04/64Bit*
* Note that other setups might work, but cannot be supported due to the overhead that would involve.
* Install ROS Indigo as "described here":http://wiki.ros.org/indigo/Installation/Ubuntu

Choose the desktop variant:
<pre>
sudo apt-get install ros-indigo-desktop
</pre>

Checkout software (please note of the . at the end):
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

Open new terminal before starting to work on THORMANG software.
