#!/bin/bash

#定义主机名
IPAddress="223.5.5.5"
#检测网络。
function CheckNetStatus() {
	ping -c 10 -W 3 $1 &>/dev/null
	if [ $? -eq 0 ]; then
		return 0
	else
		return -1
	fi
}

wifiState=$(ifconfig | egrep -E 'ra0|rai0|wlan0|wlan1' | awk 'END {print}' | grep -v grep)

#检测网络情况
CheckNetStatus $IPAddress

if [ $? -ne 0 ]; then
	if [ ! -z "$wifiState" ]; then
		echo "重载wifi"
		/etc/init.d/smartdns restart
                /etc/init.d/dnsmasq restart
		/etc/init.d/firewall restart
		/sbin/wifi down && /sbin/wifi up
		if [ -f '/sbin/mtkwifi' ]; then
			/sbin/mtkwifi reload
		fi
	fi
fi
sleep 3

if [ -z "$wifiState" ]; then
	echo "启动wifi"
	/etc/init.d/smartdns restart
        /etc/init.d/dnsmasq restart
	/etc/init.d/firewall restart
	/sbin/wifi down && /sbin/wifi up
	if [ -f '/sbin/mtkwifi' ]; then
		/sbin/mtkwifi reload
	fi
fi
exit -1
