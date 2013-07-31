#!/bin/sh
# Vagrant settings

# Setting NOPASSWD for vagrant user
echo 'vagrant    ALL=(ALL)    NOPASSWD: ALL' > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Disable DNS
sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
