#!/bin/bash
#
# Name    :       powerdns_health
# Pupose  :       Check PowerDNS with pdns_control
# Version :       1.0      initial version
# Date    :       06-01-2023
# Autor   :       Chris van Meer <c.v.meer@atcomputing.nl>
#
#
# Usage:
# ./powerdns_health

PING=$(/usr/bin/pdns_control rping)

if [ "$PING" = PONG ]; then
    status=0
    statustxt=OK
else
    status=2
    statustxt=CRITICAL
fi
echo "<<<powerdns_health>>>"
echo "$status pdns_running_status - $statustxt"
exit $status
