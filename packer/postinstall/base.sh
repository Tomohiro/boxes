#!/bin/sh
# Install basic packages

if [ -f /etc/redhat-release ]; then
  # Add EPEL repository
  cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

  yum -y update
  yum -y groupinstall 'Development Tools'
  yum -y install kernel-headers-$(uname -r) kernel-devel-$(uname -r)
  yum -y install zlib-devel openssl-devel readline-devel sqlite-devel
  yum -y install wget perl nfs-utils bind-utils
fi

if [ -f /etc/debian_version ]; then
  apt-get -y update
  apt-get -y upgrade
  apt-get -y install build-essential
  apt-get -y linux-headers-$(uname -r)
  apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev wget curl
  apt-get clean
fi
