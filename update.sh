wget -q http://[YOUR URL]/router/fetchallmacs -O /cheyoo/maclist
chmod 600 /cheyoo/maclist
wget -q http://[YOUR URL]/router/fetchinitscript -O /cheyoo/init.sh
chmod 700 /cheyoo/init.sh
echo "/cheyoo/init.sh" > /etc/rc.local
/cheyoo/init.sh
