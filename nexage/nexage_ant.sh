#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing Ant in ${ant_install_folder}"
binstall_folder ${ant_install_folder} ${user_password}
binstall ant
binstall_folder /opt/ant ${user_password}
link ${ant_install_folder}/apache-ant-1.8.1 /opt/ant/latest ${user_password}
