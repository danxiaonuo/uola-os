#!/bin/sh

# 启用 SYN-flood 防御
uci set firewall.@defaults[0].syn_flood='1'
# 丢弃无效数据包
uci set firewall.@defaults[0].drop_invalid='0'
# 启用FullCone-NAT
uci set firewall.@defaults[0].fullcone='0'
# 入站数据
uci set firewall.@defaults[0].input='ACCEPT'
# 出站数据
uci set firewall.@defaults[0].output='ACCEPT'
# 转发
uci set firewall.@defaults[0].forward='ACCEPT'
# IP 动态伪装 LAN口
uci set firewall.@zone[0].masq='0'
# MSS 钳制 LAN口
uci set firewall.@zone[0].mtu_fix='0'
# IP 动态伪装 WAN口
uci set firewall.@zone[1].masq='1'
# MSS 钳制 WAN口
uci set firewall.@zone[1].mtu_fix='0'
# docker 动态伪装
uci set firewall.docker.masq='1'
uci commit firewall

wan_ifname=$(uci get network.wan.device 2>/dev/null)
cat /dev/null >/etc/firewall.user
echo "iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53" >>/etc/firewall.user
echo "iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53" >>/etc/firewall.user
ipaddr=$(uci get network.lan.ipaddr 2>&1 | awk -F. '{print $1 "." $2 "." $3}')
for ifname in $(ip route | grep -v 'default' | grep -i $ipaddr | awk '{print $3}'); do echo "ip6tables -t nat -I POSTROUTING -o $ifname -j MASQUERADE" >>/etc/firewall.user; done
/etc/init.d/dnsmasq restart > /dev/null 2>&1
/etc/init.d/firewall restart > /dev/null 2>&1
