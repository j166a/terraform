#!/bin/bash
set -eux

yum update -y
yum install -y httpd php php-mysqlnd php-fpm mariadb105-server

systemctl enable --now mariadb
systemctl enable --now php-fpm
systemctl enable --now httpd

mysql <<'SQL'
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'wordpress'@'localhost'
IDENTIFIED BY 'wordpress-password';

GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';

FLUSH PRIVILEGES;
SQL

cd /tmp
yum install -y tar
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
sed -i "s/username_here/wordpress/" /var/www/html/wp-config.php
sed -i "s/password_here/wordpress-password/" /var/www/html/wp-config.php

chown -R apache:apache /var/www/html

