class drupal {

  file { "/www":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    owner => "vagrant",
    mode => 777,
    before => Class[apache]
  }
 
  exec { "drush dl drupal":
      cwd => '/www',
      command => "cd /www && drush dl drupal --drupal-project-rename=drupal",
      provider => "shell",
      user => "vagrant",
      require => [
        Class["apache"],
        Class["mysql"],
        Package["drush"]
      ]
  }

  exec { "drush si":
    cwd => '/www/drupal',
    command => "cd /www/drupal && drush -y si --db-url=mysql://root:root@127.0.0.1/drupal --account-pass=admin standard",
    provider => "shell",
    require => Exec["drush dl drupal"],
    user => "vagrant"
  }
}
