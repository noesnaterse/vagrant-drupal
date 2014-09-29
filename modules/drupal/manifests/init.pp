class drupal {

  file { "/www":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    before => Class[apache]
  }
 
  exec { "drush dl drupal":
      cwd => '/www',
      command => "drush dl drupal --drupal-project-rename=drupal",
      require => [
      Class["apache"],
      Class["mysql"],
      Package["drush"]
    ]
  }

  exec { "drush si":
    cwd => '/www/drupal',
    command => "drush si --db-url=mysql://root:root@127.0.0.1/drupal --account-pass=admin standard",
    require => Exec["drush dl drupal"]
  }
}
