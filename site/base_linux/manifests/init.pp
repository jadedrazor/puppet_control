class base_linux {

  # I suggest using this file to control common linux box properties
  # such as, user keys, monitoring, s3cmd, then switch out to the project after done

  include motd

  motd::register{'base_linux':}
  motd::register{"puppet_environment" : content => "Puppet Environment: $::environment"}

  #make some groups
  $osgroups = hiera('groups')
  $osgroups.each |String $osgroup| {
      group { "$osgroup":
        name     => "$osgroup",
        ensure   => present,
      }
  }
  # Include devops users on all machines for the moment.
  users { all:  }

  # Create a devops group which we can then assign users to

}
