#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing AntInstaller in ${antinstaller_install_folder}"
binstall_folder ${antinstaller_install_folder} ${user_password}
cd ${antinstaller_install_folder}
rm -rf ${antinstaller_file_name}.jar
wget ${antinstaller_file_url}/${antinstaller_file_name}.jar
java -jar ${antinstaller_file_name}.jar
binstall_folder /opt/ant-installer ${user_password}
link ${antinstaller_install_folder}/AntInstaller-beta0.8 /opt/ant-installer/latest ${user_password}
echo "export ANTINSTALLER_HOME=/usr/local/opt/AntInstaller-beta0.8" >> ${WORKSPACE}/env_variables
