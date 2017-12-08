#!/bin/bash

cd $ROSWSS_ROOT
echo ">>> Cleaning up old workspace files..."
for f in .rosinstall* devel* build* install install_* .catkin_tools; do
    [ -f $f ] && echo "rm -iv $f" && rm -i $f
    [ -d $f ] && echo "rm -Irv $f" && rm -Ir $f
done
