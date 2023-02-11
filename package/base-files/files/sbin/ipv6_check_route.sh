#!/bin/sh

while true; do
	IPV6_MASK=$(curl -s -k -m 3 --retry 3 -6 ipv6.ip.sb | egrep '[0-9]' | awk -F'[:]+' '{print $1":"$2":"$3":"$4"::/64"}' 2>/dev/null)
	count=$(ip -6 route show | egrep -v '(default|wan|unreachable)' | grep $IPV6_MASK | grep -v "grep" | wc -l)
	if [[ $count == 0 ]]; then
		echo "IPV6地址为空"
		ifdown wan6 && ifup wan6
		sleep 30
		IPADDR_IPV4=$(uci get network.lan.ipaddr 2>&1 | awk -F. '{print $1 "." $2 "." $3}')
		IPADDR_IPV6=$(ip -6 route show default | awk '{print $3}' | sort -u | head -n 1 | egrep '[0-9]' | awk -F'[:]+' '{print  $1":"$2":"$3":"$4""}')
		LAN_IPV4_DEV=$(ip -4 route show | grep -v 'default' | grep -i $IPADDR_IPV4 | awk '{print $3}' | sort -u | head -n 1 2>&1)
		LAN_IPV6_GW_IP=$(ip -6 route show default | grep -i $IPADDR_IPV6 | awk '{print $3}' | sort -u | head -n 1 2>&1)
		LAN_IPV6_GW_DEV=$(ip -6 route show default | grep -i $IPADDR_IPV6 | awk '{print $7}' | sort -u | head -n 1 2>&1)
		LAN_IPV6_DEV=$(ip -6 route show | egrep -v '(default|'$LAN_IPV6_GW_DEV')' | grep -i $IPADDR_IPV6 | awk '{print $3}' | sort -u | head -n 1 2>&1)
		LAN_IPV6_GW=$(ip -6 route show default | grep -i $IPADDR_IPV6 | awk '{print $5}')
		IPV6_ROUTE=$(curl -s -k -m 3 --retry 3 -6 ipv6.ip.sb | egrep '[0-9]' | awk -F'[:]+' '{print $1":"$2":"$3":"$4"::/64"}' 2>/dev/null)
		IPV6_FROM=$(ip -6 route show | egrep -i '(::/64)' | egrep -i $LAN_IPV4_DEV | awk '{if(length($1)>22) print $1}' | sed -n 's|\([^ ]*/64\).*$|\1|p' | sort -u | head -n 1 2>&1)
		ULA_PREFIX=$(uci get network.globals.ula_prefix 2>&1 | cut -d ':' -f 1 2>&1)
		if [[ "$IPV6_ROUTE" != "$IPV6_FROM" ]]; then
			uci -q delete network.globals.ula_prefix
			ip -6 route del default from $IPV6_FROM via $LAN_IPV6_GW dev $LAN_IPV6_GW_DEV >/dev/null 2>&1
			ip -6 route del default from $LAN_IPV6_GW_IP via $LAN_IPV6_GW dev $LAN_IPV6_GW_DEV >/dev/null 2>&1
			ip -6 route del $IPV6_FROM dev $LAN_IPV4_DEV >/dev/null 2>&1
			ip -6 route del $IPV6_FROM dev $LAN_IPV6_GW_DEV >/dev/null 2>&1
			ip -6 route del $IPV6_FROM dev lo >/dev/null 2>&1
			ip -6 route del fe80::/64 dev $LAN_IPV4_DEV metric 2 >/dev/null 2>&1
			ip -6 route del $ULA_PREFIX::/64 dev $LAN_IPV4_DEV metric 3 >/dev/null 2>&1
			sleep 3
			uci set network.globals.ula_prefix=$IPV6_ROUTE
			uci -q delete network.globals.packet_steering
			uci commit network
			/etc/init.d/network reload
			ip -6 route add default from $IPV6_ROUTE via $LAN_IPV6_GW dev $LAN_IPV6_GW_DEV metric 100 >/dev/null 2>&1
			ip -6 route add $IPV6_ROUTE dev $LAN_IPV4_DEV metric 1 >/dev/null 2>&1
			ip -6 route add unreachable $IPV6_ROUTE dev lo proto static metric 2147483647 >/dev/null 2>&1
			ip -6 route show
			echo "新增IPV6默认路由地址为:$IPV6_MASK"
		fi
	else
		echo "IPV6默认路由地址为:$IPV6_MASK"
		exit 0
	fi
done
