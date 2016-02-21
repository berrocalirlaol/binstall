#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing MongoDB in ${mongodb_install_folder}"
binstall_folder ${mongodb_install_folder} ${user_password}
binstall mongodb
mv ${mongodb_install_folder}/${mongodb_file_name} ${mongodb_install_folder}/mongodb-3.2.3 
