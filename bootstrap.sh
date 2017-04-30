#!/usr/bin/sh

set -eu

# Dependencies

if ! hash yum 2>/dev/null; then
    apt install -y git
else
    yum install -y git
fi

# User

if [ -z $USER ]
then
    USER=jerry
fi

if [ -z $PASSWORD ]
then
    PASSWORD='$6$rounds=666666$hypertension$LxNM/PPbjauIBoXp0XPgOdYmr/jXvPwei133CZfbUxWoPR6U.JLAKyCFCln33ikGUWIQBEOPVCvLm.7hoHT.f1'
fi

id -u $USER &>/dev/null || useradd -G sudo -p $PASS $USER
