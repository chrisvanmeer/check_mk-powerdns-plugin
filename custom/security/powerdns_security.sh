#!/bin/bash
#
# Name    :       powerdns_security
# Pupose  :       Checks in with powerdns.com for security updates.
# Version :       1.0      initial version
# Date    :       06-01-2023
# Autor   :       Chris van Meer <c.v.meer@atcomputing.nl>
#
#
# Usage:
# ./powerdns_security
#
# Needs:
# dig

dig=$(which dig)
pdnsutil=$(which pdnsutil)
version=$($pdnsutil --version | awk '{print $(NF)}')
fqdn="auth-$version.security-status.secpoll.powerdns.com"
echo "<<<powerdns_security>>>"
$dig $fqdn txt +short | tr -d '"'
