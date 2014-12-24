#!/bin/bash

# Install some utilities
apt-get -y update
apt-get -y install curl wget unzip git ack-grep htop vim tmux

# install mysql-server
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
apt-get -y install mysql-server

# Install Apache2
apt-get -y install apache2 libapache2-mod-php5 php5-mysql php5-gd php5-curl
a2enmod rewrite

# install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Drush
git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
cd /usr/local/src/drush
ln -s /usr/local/src/drush/drush /usr/bin/drush
composer install

# make the webroot writable
chown vagrant /var/www
