#!/system/bin/sh

MODDIR=${0%/*}

update_description() {
    sed -i "s/description=\[.*\]/description=\[$1\]/" "${MODDIR}/module.prop"
}

if [[ -f /data/adb/box/run/box.pid ]]; then
    echo "🟢Service is running"
    nohup ${MODDIR}/autoping123 > /dev/null &
else
    echo "🔴Service is disabled"
    update_description "🔴Service is disabled"
    su -lp 2000 -c "cmd notification post -S bigtext -t 'AUTO PING' 'Tag' 'status : 🔴Service is disabled'"
    killall autoping123.sh
fi
