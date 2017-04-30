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

id -u $USER &>/dev/null || useradd -G sudo $USER
