#!/bin/bash
#
# Name    :       powerdns_health.sh
# Pupose  :       Check PowerDNS API for response
# Version :       1.0      initial version
# Date    :       06-01-2023
# Autor   :       Chris van Meer <c.v.meer@atcomputing.nl>
#
#
# Usage:
# ./powerdns_health.sh

PING=$(/usr/bin/pdns_control rping)

if [ "$PING" = PONG ]; then
    status=0
    statustxt="PowerDNS is up and running"
else
    status=2
    statustxt="PowerDNS is NOT running"
fi
echo "$status \"PowerDNS Health Check\" - $statustxt"
