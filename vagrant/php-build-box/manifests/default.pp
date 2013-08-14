$home  = '/home/vagrant'
$user  = 'vagrant'
$group = 'vagrant'


# Default settings

Exec {
  path => '/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
}


exec { 'yum-update':
  command => '/usr/bin/yum update -y',
  timeout => 0
}

# Dependency packages

$build_packages = [
  'ntp',
  'git',
  'rpmdevtools',
  'vim-enhanced',
  'postgresql-devel',
  'postgresql-server',
  'libxml2-devel',
  'httpd-devel',
  'openssl-devel',
  'libjpeg-turbo-devel',
  'libpng-devel',
  'krb5-devel',
  'autoconf213',
  'libcurl-devel',
  'dbus-devel',
]

package { $build_packages:
  ensure  => latest,
  require => Exec['yum-update'];
}

service { 'ntpd':
  enable  => true,
  ensure  => running,
  require => Package[$build_packages]
}


# Service configuration

$disable_services = [
  'iptables',
  'ip6tables',
  'auditd',
  'netfs',
  'nfslock',
  'mdmonitor',
  'iscsi',
  'iscsid',
  'rpcbind',
  'rpcidmapd'
]

service { $disable_services:
  enable => false,
  ensure => stopped
}


file { $home:
  ensure => directory,
  mode   => '0755'
}

file { "${home}/.bash_profile":
  ensure  => present,
  content => template('bash_profile'),
  owner   => $user,
  group   => $group,
  require => Package[$build_packages]
}

file { "${home}/.bashrc":
  ensure  => present,
  content => template('bashrc'),
  owner   => $user,
  group   => $group,
  require => Package[$build_packages]
}


# Deploy phpenv

exec { 'clone-phpenv':
  user    => $user,
  command => "git clone https://github.com/phpenv/phpenv.git ${home}/.phpenv",
  creates => "${home}/.phpenv",
  require => Package[$build_packages]
}
