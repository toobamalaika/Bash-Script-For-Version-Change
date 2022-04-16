#!/bin/bash
echo "Which PHP version would you like to enable?";

read version;
sudo a2dismod php5.6;
sudo a2dismod php7.1;
sudo a2dismod php7.4;
sudo a2dismod php8.1;

echo "Enabling...";
sudo a2enmod php"$version";
sudo update-alternatives --set php /usr/bin/php"$version"
sudo update-alternatives --set phar /usr/bin/phar"$version"
sudo update-alternatives --set phar.phar /usr/bin/phar.phar"$version"
sudo update-alternatives --set phpize /usr/bin/phpize"$version"
sudo update-alternatives --set php-config /usr/bin/php-config"$version"

sudo systemctl restart apache2;
sudo service apache2 restart;
