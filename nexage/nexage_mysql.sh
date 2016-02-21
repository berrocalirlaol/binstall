#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing MySQL in ${mysql_install_folder}"
sudo apt-get install mysql-server
sudo service mysql restart
