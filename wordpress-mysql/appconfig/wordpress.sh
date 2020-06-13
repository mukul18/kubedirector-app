#!/bin/bash

EXPECTED_ARGS=1

tar xzvf /opt/configscripts/latest.tar.gz -C /tmp
rsync -avP /tmp/wordpress/ /var/www/html/
mkdir -p /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*

cd /var/www/html

cp wp-config-sample.php wp-config.php


sed -i 's/database_name_here/wordpress/g' wp-config.php
sed -i 's/username_here/wordpress/g' wp-config.php
sed -i 's/password_here/wordpress/g' wp-config.php
sed -i "s/localhost/$1/g" wp-config.php
sed -i 's/AllowOverride none/AllowOverride all/g' /etc/httpd/conf/httpd.conf

#log_exec sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf

systemctl restart httpd
