#!/bin/sh
iptables -F cheyoo_macs 2> /dev/null
iptables -D delegate_input -j cheyoo_macs 2> /dev/null
iptables -X cheyoo_macs 2> /dev/null
iptables -N cheyoo_macs
chainpos=`iptables -L delegate_input | awk '$1=="syn_flood" {print NR}' 2>> /cheyoo/log`
let chainpos-=1
iptables -I delegate_input ${chainpos} -j cheyoo_macs
for mac in $(cat /cheyoo/maclist)
do
iptables -A cheyoo_macs -m mac --mac-source ${mac:0:17} -j ACCEPT
done
iptables -A cheyoo_macs -j DROP
