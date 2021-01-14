class profile::default_conf {
  include profile::ssh_server

  package { 'python-setuptools':
    ensure => installed,
    provider  => apt,
  }

  package { 'python-pip':
    ensure => installed,
    provider  => apt,
  }

  package { 'python3-pip':
    ensure    => installed,
    provider  => apt,
  }

  package { 'virtualenv':
    ensure    => installed,
    provider  => pip3,
  }

}
