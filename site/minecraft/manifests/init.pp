class minecraft (
  # here we are exposing the variables as parameters. One of the advantages of this is that you can override these
  # parameters in the site/profile/manifests/minecraft.pp file, there you can set different directory
  $url = 'https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar',
  $install_dir = '/opt/minecraft'
  ){
  file {'/opt/minecraft':
    ensure => directory,
  }

  file {"${install_dir}/server.jar":
    ensure => file,
    source => $url,
    # here we are ensuring that minecraft jar  is downloaded before the service block is executed.
    # this is done to ensure ordering is correct. Though we are declaring it before the  service block
    # it does not matter, when this file is compiled it will take the ordering.
    before => Service['minecraft'],
  }

  package {'java':
    ensure => present,
  }

  # instead of hardcoded file name, we are using parameter which we have defined on the top
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }

  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    # source => 'puppet:///modules/minecraft/minecraft.service',
    # instead of using the flat file we are using templates which can be dynamically generated based on parameters and variables
    content => epp('minecraft/minecraft.service', {
        install_dir => $install_dir
      })
  }

  service {'minecraft':
    ensure => running,
    enable => true,
    # here we are making sure that before running the service following filies or package are present
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
