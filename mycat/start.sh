#!/bin/bash
#/usr/local/mysql/bin/mysqld_safe --datadir='/usr/local/mysql/data' &
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &
/opt/mycat/bin/mycat start &
/usr/local/tomcat/bin/catalina.sh run