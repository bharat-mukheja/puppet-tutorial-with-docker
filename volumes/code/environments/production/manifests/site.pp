node default {
  file {'/tmp/example-ip':
    ensure  => present,
    mode    => '0644',
    content => "Here is my Public IP Address: ${ipaddress_eth0}.\n",
  }
  file {'/etc/inetd.conf':
    ensure => '/etc/inet/inetd.conf',
  }
  include '::apt'
  include '::mysql::server'
  include '::php'
  package { 'apache2':
    ensure => installed,
  }
  service { 'apache2':
    ensure => running,
  }
}

