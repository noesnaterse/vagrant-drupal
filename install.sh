#!/bin/bash

# Add the docker apt repo 
cat "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
apt-get update
apt-get install -t wheezy-backports linux-image-amd64

# Install some utilities
apt-get -y install curl wget unzip git ack-grep htop vim tmux

# Install docker
curl -sSL https://get.docker.com/ | sh

# install mysql-server
#echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
#echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
#apt-get -y install mysql-server

# Install Apache2
#apt-get -y install apache2 libapache2-mod-php5 php5-mysql php5-gd php5-curl
#a2enmod rewrite

# install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Drush
git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
cd /usr/local/src/drush
ln -s /usr/local/src/drush/drush /usr/bin/drush
composer install

# make the webroot writable
#chown vagrant /var/www

