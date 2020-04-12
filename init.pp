class accounts {
  $rootgroup = $osfamily ? {
    'Debian'  => 'sudo',
    'RedHat'  => 'wheel',
    default   => warning('This distribution is not supported by the Accounts module'),
  }
  user { 'mahendra':    
    ensure  => present,
    home  => '/home/mahendra',
    shell  => '/bin/bash',
    managehome  => true,
    gid  => 'mahendra',
    groups  => "$rootgroup",
    password  => 'your_password_hash',
  }
}

