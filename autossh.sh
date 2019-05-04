#!/bin/bash
#
# prep:
# using rc.local to start autossh
#  sudo -iu pi /usr/bin/screen -dmS AUTOSSH bash -c '/opt/script/auto.sh; exec bash'
#
# SET initial connection variable
CTEST=0

#connection test lopped until 4 pings in a row are answering
until [ $CTEST -eq 4 ]
do
 CTEST=$(ping -c 4 google.com | grep "packets transmitted" | awk '{ print $4 }')
 logger AUTOSSH-CONECTION-TEST: $CTEST
 sleep 1
done

# START autossh
autossh -M 0 -p 63222 -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -i /home/pi/.ssh/id_rsa -R 4444:127.0.0.1:22 <user>@<myserver>
