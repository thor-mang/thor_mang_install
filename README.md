# thor_mang_install
Provides rosinstall files and scripts for making installation of thor_mang software more convenient.

## Desktop/Laptop

General remarks:

*The standard computer setup we use is Ubuntu 14.04/64Bit*
* [[setup_ubuntu1404 | Recommended setup for Ubuntu 14.04/64Bit]]
* Note that other setups might work, but cannot be supported due to the overhead that would involve.

* Set up your git user credentials as described in [[working_with_git | Working with git]].
* Make sure you have set up a SSH key in Gitlab correctly. See for example "here":http://doc.gitlab.com/ce/ssh/README.html.
* The key has to be added to the SIM gitlab web interface "here":https://git.sim.informatik.tu-darmstadt.de/profile/keys

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

If you would like to have the TUD internal rosinstalls and scripts available, then just clone:
<pre>
git clone https://git.sim.informatik.tu-darmstadt.de/ThorMangDev/thor_mang_custom_install.git rosinstall/optional/custom
git clone https://git.sim.informatik.tu-darmstadt.de/ThorMangDev/thor_mang_custom_scripts.git src/thor/thor_mang_scripts/scripts/custom
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
