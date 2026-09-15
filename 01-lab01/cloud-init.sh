#!/bin/bash
set -eux

yum update -y
yum install -y httpd php php-mysqlnd php-fpm mariadb-server

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

cat > /var/www/html/index.php <<'EOF'
<?php
echo "<h1>WordPress EC2 instance ready</h1>";
echo "<p>PHP is working!</p>";
?>
EOF
