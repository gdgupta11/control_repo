node default {
  file {'/root/README':
   ensure   => file,
   content  => 'This is a readme file',
   owner    => 'root',
   }
}


node 'master.puppet.vm'{
  include role::master_server
}

node 'db.puppet.vm' {
  include role::db_server
}
