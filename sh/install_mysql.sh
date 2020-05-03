#!/bin/bash
debconf-set-selections <<< 'mysql-server mysql-server/root_password password pwd'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password pwd'
apt-get -y install mysql-server
