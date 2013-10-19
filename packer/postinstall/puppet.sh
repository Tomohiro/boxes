#!/bin/sh

ARCH=$(uname -i)

if [ -f /etc/system-release ]; then
  rpm -ivh "http://yum.puppetlabs.com/el/6/products/${ARCH}/puppetlabs-release-6-7.noarch.rpm"
  yum -y install puppet facter
fi

if [ -f /etc/debian_version ]; then
  apt-get -y install puppet facter
fi
