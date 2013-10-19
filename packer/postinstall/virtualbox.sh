#!/bin/sh
# Install VirtualBox Guest Additions

ARCH=$(uname -i)

if [ -f /etc/system-release ]; then
  rpm -ivh "http://download.fedoraproject.org/pub/epel/6/${ARCH}/epel-release-6-8.noarch.rpm"
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
