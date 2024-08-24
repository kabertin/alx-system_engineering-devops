# Puppet manifest to fix file permission issues and ensure Apache is running properly

# Ensure the Apache service is running
service { 'apache2':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

# Ensure correct ownership and permissions for a key PHP file or directory
file { '/var/www/html':
  ensure  => directory,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  recurse => true,   # Recursively apply the permissions and ownership
}

# Apply permissions to a specific file (if needed)
file { '/var/www/html/index.php':
  ensure  => file,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
}

# Ensure that the PHP module is installed and enabled in Apache
package { 'libapache2-mod-php':
  ensure => installed,
  before => Service['apache2'],
}

# Restart Apache to apply changes
exec { 'restart_apache':
  command     => '/usr/sbin/service apache2 restart',
  refreshonly => true,
  subscribe   => File['/var/www/html'],
}

