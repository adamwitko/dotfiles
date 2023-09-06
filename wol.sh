#!/bin/bash

#MAC_ADDRESS="00:11:22:33:44:55"  # MAC address of the target PC
#BROADCAST_ADDRESS="192.168.1.255"  # Broadcast address of your local network

# Check if 'wakeonlan' command is installed
if ! command -v wakeonlan &> /dev/null; then
    echo "Please install 'wakeonlan' command."
    exit 1
fi

# Send the WOL magic packet
wakeonlan -i $BROADCAST_ADDRESS $MAC_ADDRESS

echo "WOL magic packet sent to $MAC_ADDRESS."
