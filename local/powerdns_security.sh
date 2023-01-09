#!/bin/bash
#
# Name    :       powerdns_security.sh
# Pupose  :       Checks in with powerdns.com for security updates.
# Version :       1.0      initial version
# Date    :       06-01-2023
# Autor   :       Chris van Meer <c.v.meer@atcomputing.nl>
#
#
# Usage:
# ./powerdns_security.sh
#
# Needs:
# dig

dig=$(which dig)
pdnsutil=$(which pdnsutil)
version=$($pdnsutil --version | awk '{print $(NF)}')
fqdn="auth-$version.security-status.secpoll.powerdns.com"
result=$($dig $fqdn txt +short | tr -d '"')
returncode=$(echo $result | cut -d ' ' -f1)
returnbody=$(echo $result | cut -d ' ' -f2-)

case $returncode in

  1)
    checkmkcode=0
    ;;
  2)
    checkmkcode=1
    ;;
  3)
    checkmkcode=2
    ;;
  *)
    checkmkcode=3
    ;;

esac

echo "$checkmkcode \"PowerDNS Security Status\" - $returnbody"
