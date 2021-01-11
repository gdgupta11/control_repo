class role::app_server {
  include profile::web
  include profile::base
  inlcude profile::app
}
