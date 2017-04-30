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

id -u $USER &>/dev/null || useradd -G sudo -p $PASSWORD $USER
curl https://github.com/jerrywardlow.keys >> /home/$USER/.ssh/authorized_keys
su $USER -c "git clone https://github.com/jerrywardlow/dotfiles /home/$USER/dotfiles/"
su $USER -c "/home/$USER/dotfiles/install.sh"

# SSH

sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i -e '/^PasswordAuthentication/s/^.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
echo "\nAllowUsers $USER" >> /etc/ssh/sshd_config
service ssh restart
