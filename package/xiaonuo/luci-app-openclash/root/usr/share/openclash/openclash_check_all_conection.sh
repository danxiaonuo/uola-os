#!/bin/sh
. /lib/functions.sh

urlencode() {
	local data
	if [ "$#" != 1 ]; then
		return 1
	fi
	data=$(curl -s -m 3 --retry-delay 3 --retry 3 -k -4 --header 'cache-control: no-cache' -o /dev/null -w %{url_effective} --get --data-urlencode "$1" "")
	if [ ! -z "$data" ]; then
		echo "${data##/?}"
	fi
	return 0
}

check_all_groupname() {
	SECRET=$(uci -q get openclash.config.dashboard_password)
	LAN_IP=$(uci -q get network.lan.ipaddr | awk -F '/' '{print $1}' 2>/dev/null || ip addr show 2>/dev/null | grep -w 'inet' | grep 'global' | grep 'brd' | grep -Eo 'inet [0-9\.]+' | awk '{print $2}' | head -n 1)
	PORT=$(uci -q get openclash.config.cn_port)
	PROVIDERS_NAME=$(curl -s -m 3 --retry-delay 3 --retry 3 -k -4 --header 'cache-control: no-cache' -H "Authorization: Bearer ${SECRET}" http://"$LAN_IP":"$PORT"/providers/proxies | jq -r .providers | jq -r 'to_entries[] | [.key] | @tsv' 2>/dev/null)
	echo -e "$PROVIDERS_NAME" | while read groupname
	do
	   PROVIDERS_NAMES=$(urlencode "$(echo $groupname)")
	   curl -s -m 3 --retry-delay 3 --retry 3 -k -4 --header 'cache-control: no-cache' -H "Authorization: Bearer ${SECRET}" http://"$LAN_IP":"$PORT"/providers/proxies/$PROVIDERS_NAMES/healthcheck
	done
}

#check_all_nodename() {
#	SECRET=$(uci -q get openclash.config.dashboard_password)
#	LAN_IP=$(uci -q get network.lan.ipaddr | awk -F '/' '{print $1}' 2>/dev/null || ip addr show 2>/dev/null | grep -w 'inet' | grep 'global' | grep 'brd' | grep -Eo 'inet [0-9\.]+' | awk '{print $2}' | head -n 1)
#	PORT=$(uci -q get openclash.config.cn_port)
#	NODE_NAME=$(curl -s -m 3 --retry-delay 3 --retry 3 -k -4 --header 'cache-control: no-cache' -H "Authorization: Bearer ${SECRET}" http://"$LAN_IP":"$PORT"/providers/proxies | jq -r '.providers' | jq -r '.[].proxies' | jq -r 'to_entries[] | [.value.name] | @tsv' 2>/dev/null)
#	echo -e "$NODE_NAME" | while read nodename
#	do
#	   NODE_NAMES=$(urlencode "$(echo $nodename)")
#           curl -s -m 3 --retry-delay 3 --retry 3 -k -4 --header 'cache-control: no-cache' -H "Authorization: Bearer ${SECRET}" "http://"$LAN_IP":"$PORT"/proxies/$NODE_NAMES/delay?timeout=5000&url=http://www.gstatic.com/generate_204"
#	done
#}

if [ "$1" = "check_all_conection" ]; then
	check_all_groupname
	#check_all_nodename
	exit 0
fi
