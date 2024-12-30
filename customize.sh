SKIPUNZIP=1
arch=$(getprop ro.product.cpu.abi)
api_level=$(getprop ro.build.version.sdk)
if [ $BOOTMODE != true ]; then
  abort "Error: please install from Magisk Manager!"
fi
unzip -o "${ZIPFILE}" -x 'META-INF/*' -d $MODPATH >&2
set_perm ${MODPATH}/config.ini 0 0 0644
set_perm ${MODPATH}/autoping123 0 0 0755
set_perm ${MODPATH}/action.sh 0 0 0755
set_perm ${MODPATH}/service.sh 0 0 0755
set_perm ${MODPATH}/curl 0 0 0755
