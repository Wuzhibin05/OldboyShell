#!/bin/bash
# author: wuzhibin

LOG_DIR=/var/log
ROOT_UID=0

# 判断UID是不是root的UID
if [ "${UID}" -ne "${ROOT_UID}" ]
    then
        echo "Must be root to run this script."
        exit 1
fi

# 切换到目录，判断目录 /dev/null 代表空设备文件，它等价于一个仅仅写文件，全部写入它的内容都会永远丢失。而尝试从它那儿读取内容则什么也读不到。
cd $LOG_DIR ||{
    echo "Can not change nessassary dirctory"
    exit 1
}

# 清理日志
cat /dev/null>messages &&{
    echo "Log clean up sucess"
    exit 0
}
echo "Log clean up failed"
exit 1
