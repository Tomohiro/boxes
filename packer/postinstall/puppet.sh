#!/bin/sh

if [ -f /etc/redhat-release ]; then
  # Add Puppet repository
  cat > /etc/yum.repos.d/puppetlabs.repo << EOM
[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/6/products/\$basearch
enabled=1
gpgcheck=0
EOM

  # Add Puppet dependencies repository
  #   See issue: https://github.com/jedi4ever/veewee/issues/696
  cat > /etc/yum.repos.d/puppetdeps.repo << EOM
[puppetdeps]
name=puppetdeps
baseurl=http://yum.puppetlabs.com/el/6/dependencies/\$basearch
enabled=1
gpgcheck=0
EOM

  yum -y install puppet facter
elif [ -f /etc/debian_version ]; then
  apt-get -y install puppet facter
fi
