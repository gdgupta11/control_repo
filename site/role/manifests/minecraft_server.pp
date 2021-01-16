class role::minecraft_server {
  include profile::base
  include profile::default_conf
  include profile::minecraft
}
