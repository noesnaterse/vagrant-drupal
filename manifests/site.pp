Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin", "$HOME/.composer/vendor/bin"]
}

include bootstrap
include tools
include apache
include php
include php::pear
include php::pecl
include php::composer
include php::drush
include mysql
include drupal
