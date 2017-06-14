file { '/etc/channels.yaml':
  ensure  => file,
  content => "access:\n  nobody: +v\nglobal:\n  nobody:\n  - nobody\nchannels:\n  - name: openstack-rainbow-unicorn-pals",
}

class { '::accessbot':
  nick         => 'accessbot-test',
  password     => 'infraR4lez',
  server       => 'irc.freenode.net',
  channel_file => '/etc/channels.yaml',
  require      => File['/etc/channels.yaml'],
}
