#!/bin/bash
#
#######################################################################################
# Author:	Philipp Griessler
# Company:	Serucity Consulting
#
#
# This script is used to set the brightness value for onboard intel gafixcards
# The used class is /sys/class/backlight/intel_backlight/brightness
# That value can be modified according to the used graficcard
#
#
#######################################################################################
 
# Variables to be set

MIN=500 	# minimum value expected
MAX=6500	# maximum value set
		# remark: This value is not equal to the /sys/class/backlight/intel_backlight/max_brightness

# Function testing for integer
function is_int()
{
return $(test  "$@" -eq "$@" > /dev/null 2>&1);
}

# Test input value if integer
if $(is_int "$1");
 then

  if [ $1 -gt $MIN -a $1 -le $MAX  ];
	then
	# SET BRIGHTNESS VALUE
	  echo $1 > /sys/class/backlight/intel_backlight/brightness

  else
	# ERROR if out of specified MIN MAX values
	echo "######################################"
 	echo " VALUE out of range: $1"
	echo " Usage: ./backlight [$MIN-$MAX]"
	echo "######################################"

  fi

 else
  # ERROR if not an INTEGER value
  echo "######################################"
  echo " VALUE is no INTEGER: $1"
  echo " Usage: ./backlight [$MIN-$MAX]"
  echo "######################################"

fi
