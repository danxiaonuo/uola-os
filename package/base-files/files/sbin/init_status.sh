#!/bin/bash

# 自动检测LAN口状况
grep -q net_status.sh /etc/crontabs/root || 
sed -i '$a\# 自动检测LAN口状况\n*/1 * * * * /bin/bash /sbin/net_status.sh' /etc/crontabs/root && crontab /etc/crontabs/root && /etc/init.d/cron restart
