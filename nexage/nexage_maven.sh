#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing Maven in ${maven_install_folder}"
binstall_folder ${maven_install_folder} ${user_password}
binstall maven
