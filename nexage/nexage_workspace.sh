#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Setting up WORKSPACE ${WORKSPACE} "
binstall_folder ${default_install_folder} ${user_password}
export ENV_USER=${USER}
echo ${user_password} | sudo -S mkdir -p ${WORKSPACE}
echo ${user_password} | sudo -S chown -R ${ENV_USER} ${WORKSPACE}
echo ${user_password} | sudo -S chgrp -R $ENV_USER $WORKSPACE

echo ${user_password} | sudo -S mkdir -p ${WORKSPACE}/installs
echo ${user_password} | sudo -S chown -R ${ENV_USER} ${WORKSPACE}/installs
echo ${user_password} | sudo -S chgrp -R $ENV_USER ${WORKSPACE}/installs

cp -r ./nexage/installs/ ${WORKSPACE}/installs/
