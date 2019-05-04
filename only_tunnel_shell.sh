#!/bin/bash
# catching STOP signals
trap '' 2 20 24
# clear screen
clear
# notification 
echo -e "SSH tunnel started, shell disabled by the system administrator"
# endless loop
while [ true ] ; do
sleep 1000
done
exit 0
