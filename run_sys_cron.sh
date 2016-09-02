#!/bin/sh
version=`wget -q -O- http://[YOUR URL]/router/fetchversion`
test "${version}" == "" && exit 0
local_version=`cat /cheyoo/version 2> /dev/null`
if [ "${version}" != "${local_version}" ];then
        echo "Start update version:" >> /cheyoo/log
        date +'%Y%m%d %H:%M:%S' >> /cheyoo/log
        wget -q http://[YOUR URL]/router/fetchupdatescript -O /cheyoo/update.sh
        chmod 700 /cheyoo/update.sh
        /cheyoo/update.sh
        echo ${version}>/cheyoo/version
else
        # sometimes the INIT script doesnot run when the router restarts, so we need to check again
        chainpos=`iptables -L delegate_input | awk '$1=="cheyoo_macs" {print NR}' 2>> /cheyoo/log`       
        test "${chainpos}" == "" && /cheyoo/init.sh
fi
