class profile::minecraft {
  # below is basic way of calling the module that we hve defined in /site/mincraft
  # include minecraft

  # we are defining the class here for overriding  the parameter that are defined in init.pp file
  class {'minecraft':
    install_dir => '/opt/minecraft'
  }
}
