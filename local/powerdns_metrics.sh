#!/bin/bash
#
# Name    :       powerdns_metric.sh
# Purpose :       Check PowerDNS API for specific metrics
# Version :       1.0      initial version
# Date    :       09-01-2023
# Autor   :       Chris van Meer <c.v.meer@atcomputing.nl>
#
#
# Usage:
# ./powerdns_metrics.sh
#
# Needs:
# jq

apikey=$(cat /etc/powerdns/pdns.conf | grep api-key | cut -d '=' -f2)
latency=$(curl -s -H "X-API-Key: $apikey" http://localhost:8081/api/v1/servers/localhost/statistics?statistic=latency | jq -r -c '.[] | .value')
echo "0 \"PowerDNS Latency\" powerdns_latency=$latency;5000;100000" $latency - Average number of microseconds a packet spends within PowerDNS

servfailpackets=$(curl -s -H "X-API-Key: $apikey" http://localhost:8081/api/v1/servers/localhost/statistics?statistic=servfail-packets | jq -r -c '.[] | .value')
echo "0 \"PowerDNS Database Problems\" powerdns_servfail_packets=$servfailpackets;1;10;0;10000" $servfailpackets - Amount of packets that could not be answered due to database problems

corruptpackets=$(curl -s -H "X-API-Key: $apikey" http://localhost:8081/api/v1/servers/localhost/statistics?statistic=corrupt-packets | jq -r -c '.[] | .value')
echo "0 \"PowerDNS Corrupt Packets\" powerdns_corrupt_packets=$corruptpackets;100;1000;0;10000" $corruptpackets - Number of corrupt packets received
