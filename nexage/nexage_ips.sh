#!/bin/bash
source nexage.properties
source binstall.sh

echo ${user_password} | sudo -S sh ./nexage/ips/loopback.sh

echo ${user_password} | sudo -S cp /etc/hosts /etc/hosts_backup
echo ${user_password} | sudo -S cat ./nexage/ips/hosts >> /etc/hosts

