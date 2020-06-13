#!/bin/bash

# Functions
ok() { echo -e '\e[32m'$1'\e[m'; } # Green

systemctl start mysqld

EXPECTED_ARGS=4
E_BADARGS=65
MYSQL=`which mysql`
touch /opt/configscripts/mysql
Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="GRANT ALL ON *.* TO '$2'@'localhost' IDENTIFIED BY '$3';"
Q3="GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@'$4' IDENTIFIED BY 'wordpress';"
Q4="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}"

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass host"
  exit $E_BADARGS
fi

touch /opt/configscripts/mysql1
$MYSQL -e "$SQL"

ok "Database $1 and user $2 created with a password $3"

