#!/bin/sh

dhcp_lan_ra=$(uci get dhcp.lan.ra 2>/dev/null)
dhcp_lan_dhcpv6=$(uci get dhcp.lan.dhcpv6 2>/dev/null)
dhcp_lan_ndp=$(uci get dhcp.lan.ndp 2>/dev/null)
ra_management=$(uci get dhcp.lan.ra_management 2>/dev/null)
ra_default=$(uci get dhcp.lan.ra_default 2>/dev/null)
dhcp_lan_master=$(uci get dhcp.lan.master 2>/dev/null)
packet_steering=$(uci get network.globals.packet_steering 2>/dev/null)
filter_aaaa=$(uci get dhcp.@dnsmasq[0].filter_aaaa 2>/dev/null)
last_resort=$(uci get mwan3.balanced.last_resort 2>/dev/null)
dns_redirect=$(uci get dhcp.@dnsmasq[0].dns_redirect 2>/dev/null)
if [ "$dhcp_lan_ra" != "hybrid" ]; then
      uci set dhcp.lan.ra='hybrid'
      uci set dhcp.lan.dhcpv6='hybrid'
      uci set dhcp.lan.ndp='hybrid'
      uci set dhcp.lan.ra_management='1'
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci set dhcp.wan=dhcp
      uci set dhcp.wan.interface='wan'
      uci set dhcp.wan.ignore='1'
      uci set dhcp.wan.dhcpv6='hybrid'
      uci set dhcp.wan.ra='hybrid'
      uci set dhcp.wan.ndp='hybrid'
      uci set dhcp.wan.master='1'
      uci set dhcp.wan6=dhcp
      uci set dhcp.wan6.interface='wan'
      uci set dhcp.wan6.dhcpv6='hybrid'
      uci set dhcp.wan6.ra='hybrid'
      uci set dhcp.wan6.ndp='hybrid'
      uci set dhcp.wan6.master='1'
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set mwan3.balanced.last_resort=default
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$dhcp_lan_dhcpv6" != "hybrid" ]; then
      uci set dhcp.lan.ra='hybrid'
      uci set dhcp.lan.dhcpv6='hybrid'
      uci set dhcp.lan.ndp='hybrid'
      uci set dhcp.lan.ra_management='1'
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci set dhcp.wan=dhcp
      uci set dhcp.wan.interface='wan'
      uci set dhcp.wan.ignore='1'
      uci set dhcp.wan.dhcpv6='hybrid'
      uci set dhcp.wan.ra='hybrid'
      uci set dhcp.wan.ndp='hybrid'
      uci set dhcp.wan.master='1'
      uci set dhcp.wan6=dhcp
      uci set dhcp.wan6.interface='wan'
      uci set dhcp.wan6.dhcpv6='hybrid'
      uci set dhcp.wan6.ra='hybrid'
      uci set dhcp.wan6.ndp='hybrid'
      uci set dhcp.wan6.master='1'
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set mwan3.balanced.last_resort=default
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$dhcp_lan_ndp" != "hybrid" ]; then
      uci set dhcp.lan.ra='hybrid'
      uci set dhcp.lan.dhcpv6='hybrid'
      uci set dhcp.lan.ndp='hybrid'
      uci set dhcp.lan.ra_management='1'
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci set dhcp.wan=dhcp
      uci set dhcp.wan.interface='wan'
      uci set dhcp.wan.ignore='1'
      uci set dhcp.wan.dhcpv6='hybrid'
      uci set dhcp.wan.ra='hybrid'
      uci set dhcp.wan.ndp='hybrid'
      uci set dhcp.wan.master='1'
      uci set dhcp.wan6=dhcp
      uci set dhcp.wan6.interface='wan'
      uci set dhcp.wan6.dhcpv6='hybrid'
      uci set dhcp.wan6.ra='hybrid'
      uci set dhcp.wan6.ndp='hybrid'
      uci set dhcp.wan6.master='1'
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set mwan3.balanced.last_resort=default
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$ra_management" != "1" ]; then
      uci set dhcp.lan.ra='hybrid'
      uci set dhcp.lan.dhcpv6='hybrid'
      uci set dhcp.lan.ndp='hybrid'
      uci set dhcp.lan.ra_management='1'
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci set dhcp.wan=dhcp
      uci set dhcp.wan.interface='wan'
      uci set dhcp.wan.ignore='1'
      uci set dhcp.wan.dhcpv6='hybrid'
      uci set dhcp.wan.ra='hybrid'
      uci set dhcp.wan.ndp='hybrid'
      uci set dhcp.wan.master='1'
      uci set dhcp.wan6=dhcp
      uci set dhcp.wan6.interface='wan'
      uci set dhcp.wan6.dhcpv6='hybrid'
      uci set dhcp.wan6.ra='hybrid'
      uci set dhcp.wan6.ndp='hybrid'
      uci set dhcp.wan6.master='1'
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set mwan3.balanced.last_resort=default
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$ra_default" != "" ]; then
      uci set dhcp.lan.ra='hybrid'
      uci set dhcp.lan.dhcpv6='hybrid'
      uci set dhcp.lan.ndp='hybrid'
      uci set dhcp.lan.ra_management='1'
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci set dhcp.wan=dhcp
      uci set dhcp.wan.interface='wan'
      uci set dhcp.wan.ignore='1'
      uci set dhcp.wan.dhcpv6='hybrid'
      uci set dhcp.wan.ra='hybrid'
      uci set dhcp.wan.ndp='hybrid'
      uci set dhcp.wan.master='1'
      uci set dhcp.wan6=dhcp
      uci set dhcp.wan6.interface='wan'
      uci set dhcp.wan6.dhcpv6='hybrid'
      uci set dhcp.wan6.ra='hybrid'
      uci set dhcp.wan6.ndp='hybrid'
      uci set dhcp.wan6.master='1'
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set mwan3.balanced.last_resort=default
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$dhcp_lan_master" != "" ]; then
      uci set dhcp.lan.ra='hybrid'
      uci set dhcp.lan.dhcpv6='hybrid'
      uci set dhcp.lan.ndp='hybrid'
      uci set dhcp.lan.ra_management='1'
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci set dhcp.wan=dhcp
      uci set dhcp.wan.interface='wan'
      uci set dhcp.wan.ignore='1'
      uci set dhcp.wan.dhcpv6='hybrid'
      uci set dhcp.wan.ra='hybrid'
      uci set dhcp.wan.ndp='hybrid'
      uci set dhcp.wan.master='1'
      uci set dhcp.wan6=dhcp
      uci set dhcp.wan6.interface='wan'
      uci set dhcp.wan6.dhcpv6='hybrid'
      uci set dhcp.wan6.ra='hybrid'
      uci set dhcp.wan6.ndp='hybrid'
      uci set dhcp.wan6.master='1'
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set mwan3.balanced.last_resort=default > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$packet_steering" != "" ]; then
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci commit network > /dev/null 2>&1
fi
if [ "$filter_aaaa" != "" ]; then
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit dhcp > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$dns_redirect" != "1" ]; then
      uci set dhcp.@dnsmasq[0].dns_redirect=1 > /dev/null 2>&1 
      uci commit dhcp > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
if [ "$last_resort" != "default" ]; then
      uci set mwan3.balanced.last_resort=default > /dev/null 2>&1 
      uci commit mwan3 > /dev/null 2>&1
      /etc/init.d/mwan3 restart > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
fi
