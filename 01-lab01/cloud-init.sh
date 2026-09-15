#!/bin/bash
set -eux

yum update -y
yum install -y httpd php php-mysqlnd php-fpm

cat > /var/www/html/index.php <<'EOF'
<?php
echo "<h1>WordPress EC2 instance ready</h1>";
echo "<p>PHP is working!</p>";
?>
EOF

systemctl enable --now php-fpm
systemctl enable --now httpd