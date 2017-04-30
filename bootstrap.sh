#!/usr/bin/sh

set -eu

# User

if [ -z $USER ]
then
    USER=jerry
fi

id -u $USER &>/dev/null || useradd -G sudo $USER
