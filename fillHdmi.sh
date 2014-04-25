#!/bin/sh

function log {
    LOGFILE=/var/log/HDMIrules.log
    echo "$(date +"[%b   %d %T]") $@" >> $LOGFILE
}

############
### MAIN ###
############

export DISPLAY=:0
lastdir=$(pwd)
cd /var/run/gdm/auth-for-angelsoul-*
xpathdir=$(pwd)
export XAUTHORITY=$xpathdir/database
cd $lastdir

read STATUS < /sys/class/drm/card0-HDMI-A-1/status
log "HDMI status is $STATUS"

# if HDMI is connected
if [ "$STATUS" = "connected" ]; then
    # if underscan not is on
    ERROR=$( { UNDERON=$(xrandr --verbose | grep -i 'underscan: on'); } 2>&1 )
    #echo $ERROR
    if [ -n "$ERROR" ] ; then
        log $ERROR " -> Catching information about anderscan status. Permission denied for X"
        log "XAUTORITY = $XAUTHORITY"
        log "----------------------------"
        exit 1
    fi
    if [ "$UNDERON" != "underscan: on" ] ; then
        ERROR=$( { xrandr --output HDMI-1 --set underscan on; } 2>&1 )
        #echo $ERROR
        if [ -n "$ERROR" ] ; then
            log $ERROR " -> Can't apply underscan ON"
            log "----------------------------"
            exit 2
        fi
        log "HDMI underscan switched ON"

        ERROR=$( { xrandr --output HDMI-1 --set "underscan hborder" 40 --set "underscan vborder" 26; } 2>&1 )
if [ -n "$ERROR" ] ; then
            log $ERROR " -> Can't set VBORDER to 26; Can't set HBORDER to 40"
            log "----------------------------"
            exit 3
        fi
        log "HDMI hborder=40 -> SUCCESS"
        log "HDMI vborder=26 -> SUCCESS"
    else
        # underscan is on, then exit without problems
        log "HDMI underscan is yet ON"
        log "----------------------------"
        exit 0
    fi
log "----------------------------"
# Not is connected
else
    log "HDMI is disconnected"
    log "----------------------------"
fi




