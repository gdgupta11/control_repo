 node default {
  file {'/root/README':
   ensure   => file,
   content  => 'This is a readme file',
   owner    => 'root',
   }
}

node default{
}
node 'web'{
  include role::master_server
}

node 'db' {
  include role::db_server
}
