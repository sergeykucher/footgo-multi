#!/bin/bash
/etc/init.d/mysql start
mysql -uroot -ppwd < create_db_footgo.sql
java -jar ./target/ROOT.jar
