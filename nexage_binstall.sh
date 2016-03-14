#!/bin/bash
source nexage.properties
source binstall.sh

./nexage/nexage_workspace.sh
./nexage/nexage_java.sh
./nexage/nexage_jboss.sh
./nexage/nexage_maven.sh
./nexage/nexage_mysql.sh
./nexage/nexage_ant.sh
./nexage/nexage_antinstaller.sh
./nexage/nexage_mongodb.sh
./nexage/nexage_ips.sh

