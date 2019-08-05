#!/bin/bash

# add user to dialout in order to gain access to serial converter
#if ! getent group dialout | grep &>/dev/null "\b${USER}\b"; then
#    echo_info "Adding $USER to dialout group:"
#    sudo usermod -aG dialout $USER
#    echo_info "Done"
#fi

# print warning when latency timer is wrong (assuming dongle is registered as ttyUSB0 and uses the FTDI chipset)
if [ -f /sys/bus/usb-serial/devices/ttyUSB0/latency_timer ]; then
    latency_timer=`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
    if [ $latency_timer != 1 ]; then
        echo_warn "Latency timer of USB to serial device is wrong (currently: $latency_timer, expected: 1). Communication with Dynamixel motors is likely to fail!"    
    fi
fi
