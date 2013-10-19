$home  = '/home/vagrant'
$user  = 'vagrant'
$group = 'vagrant'


# Default settings

Exec {
  path => '/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
}


exec { 'yum-update':
  command => 'yum update -y',
  timeout => 0
}

# Dependency packages

$build_packages = [
  'ntp',
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
  'perl-ExtUtils-CBuilder',
  'perl-ExtUtils-MakeMaker'
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

file { '/tmp/install-git.sh':
  ensure  => present,
  content => template('install-git.sh'),
  owner   => $user,
  group   => $group,
  mode    => '0777',
  require => Package[$build_packages]
}

exec { 'install-git':
  command => '/tmp/install-git.sh',
  creates => '/usr/local/bin/git',
  require => File['/tmp/install-git.sh']
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
  ensure => stopped,
  enable => false
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
  require => [Package[$build_packages], Exec['install-git']]
}
