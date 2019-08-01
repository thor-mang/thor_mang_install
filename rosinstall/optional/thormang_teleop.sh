#!/bin/bash

# add user to dialout in order to gain access to serial converter
if ! getent group dialout | grep &>/dev/null "\b${USER}\b"; then
    sudo usermod -aG dialout $USER
fi
