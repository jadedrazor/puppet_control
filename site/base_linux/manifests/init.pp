class base_linux {

  include motd

  motd::register{'base_linux':}
  motd::register{"puppet_environment" : content => "Puppet Environment: $::environment"}

  #make some groups (using the hiera replacement)
  $osgroups = lookup('groups',Array[String],unique)

  $osgroups.each |String $osgroup| {
      group { "$osgroup":
        name     => "$osgroup",
        ensure   => present,
      }
  }

  users { all:  }

}
