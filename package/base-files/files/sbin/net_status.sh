#!/bin/bash
# 自动检测LAN口状况

IPADDR=$(uci get network.lan.ipaddr 2>&1 | awk -F. '{print $1 "." $2 "." $3}')
LAN_DEV=$(ip route | grep -v 'default' | grep -i $IPADDR | awk '{print $3}')
LAN_IPV4=$(ip -4 addr show $LAN_DEV | grep inet | awk '{print $2}' | cut -d / -f 1 | head -n 1)
NET_IPV4=$(uci get network.lan.ipaddr 2>&1)
if [[ "$NET_IPV4" != "$LAN_IPV4" ]];then
     echo '自动检测LAN_IPV4网络'
     /etc/init.d/network restart > /dev/null 2>&1
     /etc/init.d/smartdns restart > /dev/null 2>&1
fi
