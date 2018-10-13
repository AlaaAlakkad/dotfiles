#!/bin/sh

# System tray
if [ -z "$(pgrep trayer)" ] ; then
    trayer --edge top \
           --align left \
           --widthtype percent \
           --height 20 \
           --alpha 256 \
           --transparent true \
           --width 5 \
           --tint 0x000000 &
fi

# Power manager
if [ -z "$(pgrep xfce4-power-manager)" ] ; then
    xfce4-power-manager &
fi

# Taffybar
# if [ -z "$(pgrep taffybar)" ] ; then
#     taffybar &
# fi

# Redshift
#if [ -z "$(pgrep redshift)" ] ; then
#    redshift &
#fi

# Autolock
# if [ -z "$(pgrep xautolock)" ] ; then
    # xautolock -time 1 -locker "if ! grep 'RUNNING' /proc/asound/card*/pcm*/sub*/status;then xscreensaver-command -lock; else echo 'Sound on'; fi"
# fi

# Wallpaper
if [ -z "$(pgrep nitrogen)" ] ; then
    nitrogen --restore &
fi

# Screensaver
#if [ -z "$(pgrep xscreensaver)" ] ; then
#    xscreensaver -no-splash &
#fi

# compton
if [ -z "$(pgrep compton)" ] ; then
#xcompmgr -c -C -t-5 -l-5 -r6 -o.75 &
    compton -b &
fi

# Network Applet
if [ -z "$(pgrep nm-applet)" ] ; then
    nm-applet &
fi

# Google Drive
#if [ -z "$(pgrep insync)" ] ; then
#    insync start &
#fi
# xbindkeys
#xbindkeys

    exec '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1' &
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) 
    export SSH_AUTH_SOCK


