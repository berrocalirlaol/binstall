#!/bin/bash
source nexage.properties
source binstall.sh

echo ${user_password} | sudo -S cp /etc/hosts /etc/hosts_backup
echo ${user_password} | sudo -S cp ./nexage/ips/hosts /etc/hosts

