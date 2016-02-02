#!/bin/bash
#/usr/local/mysql/bin/mysqld_safe --datadir='/usr/local/mysql/data' &

/usr/bin/mysqld_safe --datadir=/var/lib/mysql &
# wait mysql start
sleep 5s
# set mysql root password
mysql -e "grant all privileges on *.* to 'root'@'%' identified by '123456';" 
mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by '123456';" 
# create mycat used db
mysql -u root -p123456 -e "CREATE database db1;CREATE database db2;CREATE database db3;"

mysql -u root -p123456 -e "show databases;"

/opt/mycat/bin/mycat start &

tail -f /opt/mycat/logs/mycat.log 
#/usr/local/tomcat/bin/catalina.sh run