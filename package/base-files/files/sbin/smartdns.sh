#!/bin/sh

dnsmasq_port=$(uci get dhcp.@dnsmasq[0].server | awk -F '#' '{print $2}' 2>/dev/null)
dnsmasq_noresolv=$(uci get dhcp.@dnsmasq[0].noresolv 2>/dev/null)
dns_port=$(uci get smartdns.@smartdns[0].port 2>/dev/null)
dnscache=$(uci get dhcp.@dnsmasq[0].cachesize 2>/dev/null)
nonegcache=$(uci get dhcp.@dnsmasq[0].nonegcache 2>/dev/null)
allservers=$(uci get dhcp.@dnsmasq[0].allservers 2>/dev/null)
dnsforwardmax=$(uci get dhcp.@dnsmasq[0].dnsforwardmax 2>/dev/null)
boguspriv=$(uci get dhcp.@dnsmasq[0].boguspriv 2>/dev/null)
filterwin2k=$(uci get dhcp.@dnsmasq[0].filterwin2k 2>/dev/null)
localise_queries=$(uci get dhcp.@dnsmasq[0].localise_queries 2>/dev/null)
dns_redirect=$(uci get dhcp.@dnsmasq[0].dns_redirect 2>/dev/null)
localservice=$(uci get dhcp.@dnsmasq[0].localservice 2>/dev/null)
nonwildcard=$(uci get dhcp.@dnsmasq[0].nonwildcard 2>/dev/null)
rebind_protection=$(uci get dhcp.@dnsmasq[0].rebind_protection 2>/dev/null)
# 检测是否为smartdns的端口
if [ "$dnsmasq_port" = "" ]; then
	uci delete dhcp.@dnsmasq[0].server 2>/dev/null
	uci add_list dhcp.@dnsmasq[0].server=127.0.0.1#$dns_port 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
elif [ "$dnsmasq_port" -ne "$dns_port" ]; then
	uci delete dhcp.@dnsmasq[0].server 2>/dev/null
	uci add_list dhcp.@dnsmasq[0].server=127.0.0.1#$dns_port 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 忽略解析文件
if [ "$dnsmasq_noresolv" = "" ]; then
	uci delete dhcp.@dnsmasq[0].resolvfile 2>/dev/null
	uci set dhcp.@dnsmasq[0].noresolv=1 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
elif [ "$dnsmasq_noresolv" -ne "1" ]; then
	uci delete dhcp.@dnsmasq[0].resolvfile 2>/dev/null
	uci set dhcp.@dnsmasq[0].noresolv=1 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# DNS 查询缓存的大小
if [ "$dnscache" = "" ]; then
	uci set dhcp.@dnsmasq[0].cachesize=0 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
elif [ "$dnscache" -ne "0" ]; then
	uci set dhcp.@dnsmasq[0].cachesize=0 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 禁用无效信息缓存
if [ "$nonegcache" != "1" ]; then
	uci set dhcp.@dnsmasq[0].nonegcache=1 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 使用 all-servers 并发查询
if [ "$allservers" != "1" ]; then
	uci set dhcp.@dnsmasq[0].allservers=1 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 最大并发查询数
if [ "$dnsforwardmax" != "10000" ]; then
	uci set dhcp.@dnsmasq[0].dnsforwardmax=10000 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 过滤本地包
if [ "$boguspriv" != "0" ]; then
	uci set dhcp.@dnsmasq[0].boguspriv=0 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 过滤无用包
if [ "$filterwin2k" != "1" ]; then
	uci set dhcp.@dnsmasq[0].filterwin2k=1 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 本地化查询
if [ "$localise_queries" != "1" ]; then
	uci set dhcp.@dnsmasq[0].localise_queries=1 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 重定向客户端DNS到dnsmasq
if [ "$dns_redirect" != "" ]; then
	uci -q delete dhcp.@dnsmasq[0].dns_redirect 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 重绑定保护
if [ "$rebind_protection" != "0" ]; then
        uci -q delete dhcp.@dnsmasq[0].dns_redirect 2>/dev/null
        uci set dhcp.@dnsmasq[0].rebind_protection=0 2>/dev/null
        uci set dhcp.@dnsmasq[0].localservice=0 2>/dev/null
        uci commit dhcp >/dev/null 2>&1
        /etc/init.d/dnsmasq restart >/dev/null 2>&1
        /etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 仅本地服务
if [ "$localservice" != "0" ]; then
	uci set dhcp.@dnsmasq[0].localservice=0 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
# 非全部地址
if [ "$nonwildcard" != "" ]; then
	uci -q delete dhcp.@dnsmasq[0].nonwildcard 2>/dev/null
	uci commit dhcp >/dev/null 2>&1
	/etc/init.d/dnsmasq restart >/dev/null 2>&1
	/etc/init.d/smartdns restart > /dev/null 2>&1
fi
