#!/bin/bash
#
# DynDNS for Namecheap
# including check between externel IP and existing DNS entries in the internet
#

# Domain parameters
HOSTNAME="h1"
DOMAIN="domain"
DOMPW="secret"

# get external IP
GETEXTIP=$(curl -0 --silent http://checkip.dyndns.org | awk '{print $6}' | cut -f 1 -d "<")

# get external IP from DNS
GETDNSIP=$(dig +short $HOSTNAME.$DOMAIN @8.8.8.8)

# DEBUG COMMANDS
#echo "EXT: "$GETEXTIP
#echo "DNS: "$GETDNSIP

# Update DNY entry

if [ "$GETDNSIP" != "$GETEXTIP" ]; then
# https://namecheap.com
#  curl -0 --silent "http://dynamicdns.park-your-domain.com/update?domain=$DOMAIN&password=$DOMPW&host=$HOSTNAME&ip=$GETEXTIP" > /dev/null
# Domaindiscount
 curl -0 --silent "https://dynamicdns.key-systems.net/update.php?hostname=$HOSTNAME.$DOMAIN&password=$DOMPW&ip=$GETEXTIP"  > /dev/null
fi
