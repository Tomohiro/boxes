#!/bin/sh
# Install basic packages

if [ -f /etc/system-release ]; then
  yum -y update
  yum -y groupinstall 'Development Tools'
  yum -y install kernel-headers-$(uname -r) kernel-devel-$(uname -r)
  yum -y install zlib-devel openssl-devel readline-devel sqlite-devel
  yum -y install wget curl perl nfs-utils bind-utils
fi

if [ -f /etc/debian_version ]; then
  apt-get -y update
  apt-get -y upgrade
  apt-get -y install build-essential
  apt-get -y linux-headers-$(uname -r)
  apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
  apt-get -y install wget curl
fi
