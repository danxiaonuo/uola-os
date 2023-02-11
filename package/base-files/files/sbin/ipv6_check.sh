#!/bin/sh

dhcp_lan_ra=$(uci get dhcp.lan.ra 2>/dev/null)
dhcp_lan_dhcpv6=$(uci get dhcp.lan.dhcpv6 2>/dev/null)
dhcp_lan_ndp=$(uci get dhcp.lan.ndp 2>/dev/null)
ra_management=$(uci get dhcp.lan.ra_management 2>/dev/null)
ra_default=$(uci get dhcp.lan.ra_default 2>/dev/null)
dhcp_lan_master=$(uci get dhcp.lan.master 2>/dev/null)
packet_steering=$(uci get network.globals.packet_steering 2>/dev/null)
filter_aaaa=$(uci get dhcp.@dnsmasq[0].filter_aaaa 2>/dev/null)
dns_redirect=$(uci get dhcp.@dnsmasq[0].dns_redirect 2>/dev/null)
if [ "$dhcp_lan_ra" != "server" ]; then
      uci set dhcp.lan.ra='server' > /dev/null 2>&1
      uci set dhcp.lan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ra_management='1' > /dev/null 2>&1
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci -q del dhcp.lan.ra_flags > /dev/null 2>&1
      uci set dhcp.lan.ra_default='2' > /dev/null 2>&1
      uci add_list dhcp.lan.ra_flags='other-config' > /dev/null 2>&1
      uci set dhcp.wan=dhcp > /dev/null 2>&1
      uci set dhcp.wan.interface='wan' > /dev/null 2>&1
      uci set dhcp.wan.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.master='1' > /dev/null 2>&1
      uci set dhcp.wan6=dhcp > /dev/null 2>&1
      uci set dhcp.wan6.interface='wan6' > /dev/null 2>&1
      uci set dhcp.wan6.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan6.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.master='1' > /dev/null 2>&1
      uci -q delete dhcp.wan6.ra_flags > /dev/null 2>&1
      uci add_list dhcp.wan6.ra_flags='none' > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
if [ "$dhcp_lan_dhcpv6" != "hybrid" ]; then
      uci set dhcp.lan.ra='server' > /dev/null 2>&1
      uci set dhcp.lan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ra_management='1' > /dev/null 2>&1
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci -q del dhcp.lan.ra_flags > /dev/null 2>&1
      uci set dhcp.lan.ra_default='2' > /dev/null 2>&1
      uci add_list dhcp.lan.ra_flags='other-config' > /dev/null 2>&1
      uci set dhcp.wan=dhcp > /dev/null 2>&1
      uci set dhcp.wan.interface='wan' > /dev/null 2>&1
      uci set dhcp.wan.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.master='1' > /dev/null 2>&1
      uci set dhcp.wan6=dhcp > /dev/null 2>&1
      uci set dhcp.wan6.interface='wan6' > /dev/null 2>&1
      uci set dhcp.wan6.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan6.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.master='1' > /dev/null 2>&1
      uci -q delete dhcp.wan6.ra_flags > /dev/null 2>&1
      uci add_list dhcp.wan6.ra_flags='none' > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
if [ "$dhcp_lan_ndp" != "hybrid" ]; then
      uci set dhcp.lan.ra='server' > /dev/null 2>&1
      uci set dhcp.lan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ra_management='1' > /dev/null 2>&1
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci -q del dhcp.lan.ra_flags > /dev/null 2>&1
      uci set dhcp.lan.ra_default='2' > /dev/null 2>&1
      uci add_list dhcp.lan.ra_flags='other-config' > /dev/null 2>&1
      uci set dhcp.wan=dhcp > /dev/null 2>&1
      uci set dhcp.wan.interface='wan' > /dev/null 2>&1
      uci set dhcp.wan.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.master='1' > /dev/null 2>&1
      uci set dhcp.wan6=dhcp > /dev/null 2>&1
      uci set dhcp.wan6.interface='wan6' > /dev/null 2>&1
      uci set dhcp.wan6.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan6.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.master='1' > /dev/null 2>&1
      uci -q delete dhcp.wan6.ra_flags > /dev/null 2>&1
      uci add_list dhcp.wan6.ra_flags='none' > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
if [ "$ra_management" != "1" ]; then
      uci set dhcp.lan.ra='server' > /dev/null 2>&1
      uci set dhcp.lan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ra_management='1' > /dev/null 2>&1
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci -q del dhcp.lan.ra_flags > /dev/null 2>&1
      uci set dhcp.lan.ra_default='2' > /dev/null 2>&1
      uci add_list dhcp.lan.ra_flags='other-config' > /dev/null 2>&1
      uci set dhcp.wan=dhcp > /dev/null 2>&1
      uci set dhcp.wan.interface='wan' > /dev/null 2>&1
      uci set dhcp.wan.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.master='1' > /dev/null 2>&1
      uci set dhcp.wan6=dhcp > /dev/null 2>&1
      uci set dhcp.wan6.interface='wan6' > /dev/null 2>&1
      uci set dhcp.wan6.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan6.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.master='1' > /dev/null 2>&1
      uci -q delete dhcp.wan6.ra_flags > /dev/null 2>&1
      uci add_list dhcp.wan6.ra_flags='none' > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
if [ "$ra_default" != "" ]; then
      uci set dhcp.lan.ra='server' > /dev/null 2>&1
      uci set dhcp.lan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ra_management='1' > /dev/null 2>&1
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci -q del dhcp.lan.ra_flags > /dev/null 2>&1
      uci set dhcp.lan.ra_default='2' > /dev/null 2>&1
      uci add_list dhcp.lan.ra_flags='other-config' > /dev/null 2>&1
      uci set dhcp.wan=dhcp > /dev/null 2>&1
      uci set dhcp.wan.interface='wan' > /dev/null 2>&1
      uci set dhcp.wan.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.master='1' > /dev/null 2>&1
      uci set dhcp.wan6=dhcp > /dev/null 2>&1
      uci set dhcp.wan6.interface='wan6' > /dev/null 2>&1
      uci set dhcp.wan6.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan6.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.master='1' > /dev/null 2>&1
      uci -q delete dhcp.wan6.ra_flags > /dev/null 2>&1
      uci add_list dhcp.wan6.ra_flags='none' > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
if [ "$dhcp_lan_master" != "" ]; then
      uci set dhcp.lan.ra='server' > /dev/null 2>&1
      uci set dhcp.lan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.lan.ra_management='1' > /dev/null 2>&1
      uci -q delete dhcp.lan.ra_default > /dev/null 2>&1
      uci -q delete dhcp.lan.master > /dev/null 2>&1
      uci -q delete dhcp.lan.dns > /dev/null 2>&1
      uci -q del dhcp.lan.ra_flags > /dev/null 2>&1
      uci set dhcp.lan.ra_default='2' > /dev/null 2>&1
      uci add_list dhcp.lan.ra_flags='other-config' > /dev/null 2>&1
      uci set dhcp.wan=dhcp > /dev/null 2>&1
      uci set dhcp.wan.interface='wan' > /dev/null 2>&1
      uci set dhcp.wan.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan.master='1' > /dev/null 2>&1
      uci set dhcp.wan6=dhcp > /dev/null 2>&1
      uci set dhcp.wan6.interface='wan6' > /dev/null 2>&1
      uci set dhcp.wan6.ignore='1' > /dev/null 2>&1
      uci set dhcp.wan6.dhcpv6='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ra='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.ndp='hybrid' > /dev/null 2>&1
      uci set dhcp.wan6.master='1' > /dev/null 2>&1
      uci -q delete dhcp.wan6.ra_flags > /dev/null 2>&1
      uci add_list dhcp.wan6.ra_flags='none' > /dev/null 2>&1
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].cachesize=0 > /dev/null 2>&1
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1
      uci -q delete network.globals.packet_steering > /dev/null 2>&1 
      uci -q delete dhcp.@dnsmasq[0].filter_aaaa > /dev/null 2>&1
      uci commit > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
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
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
if [ "$dns_redirect" != "0" ]; then
      uci set dhcp.@dnsmasq[0].dns_redirect=0 > /dev/null 2>&1 
      uci commit dhcp > /dev/null 2>&1
      /etc/init.d/smartdns restart > /dev/null 2>&1
      /etc/init.d/dnsmasq restart > /dev/null 2>&1
      /etc/init.d/firewall restart > /dev/null 2>&1
fi
