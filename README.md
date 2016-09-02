# openwrt-manage-macs
## Openwrt, Manage Macs, Upgrade system script automaticlly

###### 路由器(仅适用于Openwrt固件)程序植入：
1. 进路由器管理界面，设置wifi名称和密码(因为手表app自动连接必需要求密码)
2. ssh到路由器命令行,创建根目录/cheyoo,给777权限,并将附件里的run_sys_cron.sh放进去,执行./cheyoo/run_sys_cron.sh
3. crontab -e，将上面的脚本加进来,每5分钟跑一次，*/5 * * * * /cheyoo/run_sys_cron.sh
4. 请替换[YOUR URL]为自己的URL，其中update.sh和init.sh都是放在URL返回的文本里的，这样如果想对路由器做一些其它的操作就可以远程完成了
