#!/bin/bash
source nexage.properties
source binstall.sh

#./nexage/nexage_workspace.sh
#./nexage/nexage_java.sh
#./nexage/nexage_jboss.sh
#./nexage/nexage_maven.sh
#./nexage/nexage_mysql.sh
#./nexage/nexage_mongodb.sh
./nexage/nexage_ips.sh

#Apache Ant
#echo -e "\n-------------------------------------------------"
#echo -e "Installing Ant in ${ant_install_folder}"
#binstall_folder ${ant_install_folder} ${user_password}
#binstall ant
#binstall_folder /opt/ant ${user_password}
#link ${ant_install_folder}/apache-ant-1.8.1 /opt/ant/latest ${user_password}

#Ant-Installer
#echo -e "\n-------------------------------------------------"
#echo -e "Installing AntInstaller in ${antinstaller_install_folder}"
#binstall_folder ${antinstaller_install_folder} ${user_password}
#cd ${antinstaller_install_folder}
#wget ${antinstaller_file_url}/${antinstaller_file_name}.jar
#java -jar ${antinstaller_file_name}.jar
#binstall_folder /opt/ant-installer ${user_password}
#link ${antinstaller_install_folder}/AntInstaller-beta0.8 /opt/ant-installer/latest ${user_password}



