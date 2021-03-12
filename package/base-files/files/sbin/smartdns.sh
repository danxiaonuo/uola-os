#!/bin/sh

dnsmasq_port=$(uci get dhcp.@dnsmasq[0].server | awk -F '#' '{print $2}' 2>/dev/null)
dnsmasq_noresolv=$(uci get dhcp.@dnsmasq[0].noresolv 2>/dev/null)
dns_port=$(uci get smartdns.@smartdns[0].port 2>/dev/null)
dnscache=$(uci get dhcp.@dnsmasq[0].cachesize 2>/dev/null)
allservers=$(uci get dhcp.@dnsmasq[0].allservers 2>/dev/null)
if [ "$dnsmasq_port" = "" ]; then
	uci delete dhcp.@dnsmasq[0].server 2>/dev/null
	uci add_list dhcp.@dnsmasq[0].server=127.0.0.1#$dns_port 2>/dev/null
	uci commit dhcp > /dev/null 2>&1
	/etc/init.d/dnsmasq restart > /dev/null 2>&1
elif [ "$dnsmasq_port" -ne "$dns_port" ]; then
	uci delete dhcp.@dnsmasq[0].server 2>/dev/null
	uci add_list dhcp.@dnsmasq[0].server=127.0.0.1#$dns_port 2>/dev/null
	uci commit dhcp > /dev/null 2>&1
	/etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$dnsmasq_noresolv" = "" ]; then
      uci delete dhcp.@dnsmasq[0].resolvfile 2>/dev/null
      uci set dhcp.@dnsmasq[0].noresolv=1 2>/dev/null
      uci commit dhcp > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
elif [ "$dnsmasq_noresolv" -ne "1" ]; then
	uci delete dhcp.@dnsmasq[0].resolvfile 2>/dev/null
	uci set dhcp.@dnsmasq[0].noresolv=1 2>/dev/null
	uci commit dhcp > /dev/null 2>&1
	/etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$dnscache" = "" ]; then
      uci set dhcp.@dnsmasq[0].cachesize=0 2>/dev/null
      uci commit dhcp > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
elif [ "$dnscache" -ne "0" ]; then
	uci set dhcp.@dnsmasq[0].cachesize=0 2>/dev/null
	uci commit dhcp > /dev/null 2>&1
	/etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$allservers" != "1" ]; then
      uci set dhcp.@dnsmasq[0].allservers=1 2>/dev/null
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
