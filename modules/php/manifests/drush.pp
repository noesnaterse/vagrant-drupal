class php::drush {
  include php

  package { "drush":
    ensure => present,
    require => [
      Class["php::composer"], 
      Package["git"]
    ]
  }
}
