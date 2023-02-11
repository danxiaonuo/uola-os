#!/bin/sh

rm -rf /etc/smartdns/smartdns_*.conf
wget 'https://down.xiaonuo.live?url=https://raw.githubusercontent.com/danxiaonuo/gwf/main/smartdns/smartdns_gfw_domain.conf' -O /etc/smartdns/smartdns_gfw_domain.conf
wget 'https://down.xiaonuo.live?url=https://raw.githubusercontent.com/danxiaonuo/gwf/main/smartdns/smartdns_xiaonuo_domain.conf' -O /etc/smartdns/smartdns_xiaonuo_domain.conf
/etc/init.d/smartdns restart && /etc/init.d/smartdns status
