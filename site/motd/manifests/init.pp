
class motd {
  $motd = '/etc/motd'

  pe_concat { $motd:
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }

  pe_concat::fragment{ 'motd_header':
    target  => $motd,
    content => "\nPuppet modules on this server:\n\n",
    order   => '01'
  }

  # local users on the machine can append to motd by just creating
  # /etc/motd.local
# pe_concat::fragment{ 'motd_local':
#  target => $motd,
#  source => '/etc/motd.local',
#  order  => '15'
# }
}
