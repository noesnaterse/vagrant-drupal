class php::composer {
  include php

  exec { "curl -sS https://getcomposer.org/installer | php":
    require => Package["curl"] 
  }

  exec { "mv composer.phar /usr/local/bin/composer":
    require => Exec["curl -sS https://getcomposer.org/installer | php"]
  }  
}
