#!/system/bin/sh
MODDIR=${0%/*}
BFR=/data/box/scripts/box.service

nohup $MODDIR/autoping123 > /dev/null &
sed -i '/start_box/a \ \ \ \ nohup /data/adb/modules/Auto_Ping/autoping123 > /dev/null &' $BFR