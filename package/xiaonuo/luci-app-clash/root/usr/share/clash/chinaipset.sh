# curl -s -m 3 --retry-delay 3 --retry 3 -k -4 --header 'cache-control: no-cache' --url 'https://proxy.danxiaonuo.workers.dev/?url=https%3A%2F%2Fraw.githubusercontent.com%2F17mon%2Fchina_ip_list%2Fmaster%2Fchina_ip_list.txt' > /usr/share/clash/china_ip.txt

echo "create china hash:net family inet hashsize 1024 maxelem 65536" > /tmp/china.ipset
awk '!/^$/&&!/^#/{printf("add china %s'" "'\n",$0)}' /usr/share/clash/china_ip.txt >> /tmp/china.ipset
ipset -! flush china
ipset -! restore < /tmp/china.ipset 2>/dev/null
rm -f /tmp/china.ipset

sleep 1
 
echo "create china6 hash:net family inet6 hashsize 1024 maxelem 1000000" > /tmp/china6.ipset
awk '!/^$/&&!/^#/{printf("add china6 %s'" "'\n",$0)}' /usr/share/clash/china6_ip.txt >> /tmp/china6.ipset
ipset -! flush china6
ipset -! restore < /tmp/china6.ipset 2>/dev/null
rm -f /tmp/china6.ipset

sleep 1
