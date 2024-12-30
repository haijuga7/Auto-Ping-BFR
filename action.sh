#!/system/bin/sh

MODDIR=${0%/*}

update_description() {
    sed -i "s/description=\[.*\]/description=\[$1\]/" "${MODDIR}/module.prop"
}

if [[ -f $MODDIR/enable ]]; then
    echo "🔴Service is disabled"
    update_description "🔴Service is disabled"
    su -lp 2000 -c "cmd notification post -S bigtext -t 'AUTO PING' 'Tag' 'status : 🔴Service is disabled'" > /dev/null &
    killall Auto_Ping
    rm $MODDIR/enable
else
    echo "🟢Service is running"
    nohup ${MODDIR}/Auto_Ping > /dev/null &
fi
