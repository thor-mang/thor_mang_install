#!/bin/bash

# add user to dialout in order to gain access to serial converter
if ! getent group dialout | grep &>/dev/null "\b${USER}\b"; then
    echo_info "Adding $USER to dialout group:"
    sudo usermod -aG dialout $USER
    echo_info "Done"
fi
