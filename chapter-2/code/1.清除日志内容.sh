#!/bin/bash
# author: wuzhibin

# clean  linux system logs.
# /var/log/messages 是linux系统日志文件。
cd /var/log
cat /dev/null>messages
echo "Logs cleaned up."