#!/usr/bin/sh

set -e

# Dependencies

if hash apt 2>/dev/null; then
    apt install -y git
elif hash yum 2>/dev/null; then
    yum install -y git
elif hash dnf 2>/dev/null; then
    dnf install -y git
fi

# User

if [ -z $NEWUSER ]; then
    NEWUSER=jerry
fi

if [ -z $PASSWORD ]; then
    PASSWORD='$6$rounds=666666$hypertension$LxNM/PPbjauIBoXp0XPgOdYmr/jXvPwei133CZfbUxWoPR6U.JLAKyCFCln33ikGUWIQBEOPVCvLm.7hoHT.f1'
fi

id -u $NEWUSER &>/dev/null || useradd -G sudo -p $PASSWORD $NEWUSER
curl https://github.com/jerrywardlow.keys >> /home/$NEWUSER/.ssh/authorized_keys
su $NEWUSER -c "git clone https://github.com/jerrywardlow/dotfiles /home/$NEWUSER/dotfiles/"
su $NEWUSER -c "/home/$NEWUSER/dotfiles/install.sh"

# SSH

sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i -e '/^PasswordAuthentication/s/^.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
echo "\nAllowUsers $NEWUSER" >> /etc/ssh/sshd_config
systemctl restart ssh
