class php::drush {
  include php

  exec { "composer global require drush/drush:dev-master":
    require => [
      Class["php::composer"], 
      Package["git"]
    ]
  }
}
