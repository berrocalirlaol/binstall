#!/bin/bash
source nexage.properties
source binstall.sh

echo -e "\n-------------------------------------------------"
echo -e "Installing JBoss in ${jboss_install_folder}"
binstall_folder ${jboss_install_folder} ${user_password}
binstall jboss

export JBOSS_HOME=${jboss_install_folder}/jboss-6.1.0.Final
export JBOSS_SERVER=${JBOSS_HOME}/server
echo -e "\n-------------------------------------------------"
echo -e "Installing Nexage JBoss servers in ${JBOSS_SERVER}"
cp -f ./nexage/jboss/ecj-4.4.jar ${JBOSS_HOME}/lib/endorsed/

cp -Rp ${JBOSS_SERVER}/default ${JBOSS_SERVER}/nexage
cp ./nexage/jboss/stack-agnostic-jboss-beans.xml ${JBOSS_SERVER}/nexage/deployers/jbossws.deployer/META-INF/

cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/nexus
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/ecommon
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/ecommon2
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/enode
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/enode2
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/mcommon
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/mcommon2
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/mnode
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/mnode2
cp -R ${JBOSS_SERVER}/nexage ${JBOSS_SERVER}/geneva

echo -e "\n-------------------------------------------------"
echo -e "Create JBoss install folders in ${INSTALL_HOME}"
cp -R ./nexage/installs/* ${INSTALL_HOME}

echo -e "\n-------------------------------------------------"
echo "Copy .conf files in ${CONFIG_HOME}"
cp ./nexage/jboss/*.conf ${CONFIG_HOME}

echo "Geneva configuration"
echo ${user_password} | sudo -S mkdir -p /opt/creative/bidder
