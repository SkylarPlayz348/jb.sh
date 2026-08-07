#!/bin/sh

log "Renaming OTA"

if [ -f "/usr/bin/otaupd" ] ; then
    log "Renaming otaupd"
    make_mutable /usr/bin/otaupd
    mv /usr/bin/otaupd /usr/bin/otaupd.bck
fi

if [ -f "/usr/bin/otav3" ] ; then
    log "Renaming otav3"
    make_mutable /usr/bin/otav3
    mv /usr/bin/otav3 /usr/bin/otav3.bck
fi

stop ota-update
stop otaupd
stop otav3

# Kill them asap
killall -s SIGKILL otaupd
killall -s SIGKILL otav3