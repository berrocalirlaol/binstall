#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing JAVA8---------------------------------"
binstall_folder ${java_install_folder} ${user_password}
cd ${java_install_folder}
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" ${java_file_url}/${java_file_name}.tar.gz
tar xvf ${java_file_name}.tar.gz
cd ${WORKSPACE}
echo "export JAVA_HOME=${java_install_folder}/jdk1.8.0_65" >> env_variables
echo "export PATH=\${JAVA_HOME}/bin:\${PATH}" >> path
