#!/bin/bash
# ./mysql.sh	安装mysql
# ./mysql.sh 1	使用mysql
# ./mysql.sh 0	卸载mysql
error=1
if [ -n "$1" ] && [ ! -n "$2" ]; then
    if [ $1 == "1" ]; then
        error=0
        echo "systemctl status mysql.service"
        echo "sudo mysqladmin -p -u root version"
        echo "sudo mysql -u root"
        echo
        echo "show databases;"
        echo "create database database_test;"
        echo "drop database database_test;"
        echo "use database_test;"
        echo
        echo "show tables;"
        echo "create table table_test(id bigint(20) not null, name varchar(20) not null);"
        echo "show columns from table_test;"
        echo "drop table table_test;"
        echo
        echo "insert into table_test(id,name) values(5,'name');"
        echo "update table_test set name='bob' where id=5;"
        echo "select * from table_test;"
        echo "delete from table_test where id=5;"
        echo "alter table table_test add (mark float not null, info text not null, age double not null);"
        echo "alter table table_test drop column name;"
    elif [ $1 == "0" ]; then
        error=0
        echo "卸载mysql..."
        sudo apt-get remove --purge mysql-server mysql-client libmysqlclient-dev
        sudo apt autoremove
    fi
elif [ ! -n "$1" ]; then
    error=0
    echo "安装mysql..."
    sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
    sudo mysql_secure_installation
    sudo ldconfig
fi
if [ $error == "1" ]; then
    echo "./mysql.sh	安装mysql"
    echo "./mysql.sh 1	使用mysql"
    echo "./mysql.sh 0	卸载mysql"
    exit
fi
