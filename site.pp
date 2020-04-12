node default {
#applies configuration to all the agents and master aswell
}
 
node 'puppet.example.com' {
  #applies configuration to our master node
}
 
node 'puppet-agent-ubuntu.example.com' {
 
  include accounts
 
file { '/home/mahendra/data': # Resource type file change username to the user you created
 
            ensure => 'directory', # Create a directory
 
            owner => 'root', # Ownership
 
            group => 'root', # Group Name
 
            mode => '0755', # Directory permissions
 
         }
#resources to install apache2 server.
exec { 'apt-update':	# exec resource named 'apt-update'
	command => '/usr/bin/apt-get update'  # command this resource will run
  }
 
  # install apache2 package
  package { 'apache2':
	#require => Exec['apt-update'],	# require 'apt-update' before installation
	ensure => installed,
  }
 
  # ensure apache2 service is running
  service { 'apache2':
	ensure => running,
  }
}
}

