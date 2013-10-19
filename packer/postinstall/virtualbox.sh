#!/bin/sh
# Install VirtualBox Guest Additions

if [ -f /etc/system-release ]; then
  yum -y install dkms
fi

if [ -f /etc/debian_version ]; then
  apt-get -y install dkms
fi

mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
/etc/init.d/vboxadd setup
rm /home/vagrant/VBoxGuestAdditions.iso
