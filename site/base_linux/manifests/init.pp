class base_linux {

  include motd

  motd::register{'base_linux':}
  motd::register{"puppet_environment" : content => "Puppet Environment: $::environment"}

  #make some groups
  $osgroups = hiera_array('groups')


  $osgroups.each |String $osgroup| {
      group { "$osgroup":
        name     => "$osgroup",
        ensure   => present,
      }
  }

  users { all:  }

}
