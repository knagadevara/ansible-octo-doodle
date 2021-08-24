#!/bin/bash

MYSQL_PTH=`which mysql`
SHELL_CMD1=$(${MYSQL_PTH} -u root -e 'UPDATE mysql.user SET plugin="mysql_native_password" WHERE user="root" AND host="localhost"')
echo "Running: $SHELL_CMD1"
SHELL_CMD2=$(${MYSQL_PTH} -u root -e 'FLUSH PRIVILEGES')
echo "Running: $SHELL_CMD2"