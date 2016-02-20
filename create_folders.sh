#!/bin/bash

export ENV_USER=$1
export WORKSPACE=$2
export INSTALLS_FOLDER=$3

echo "------------------------"
echo "create folders"
echo "------------------------"
echo "Operating as ${USER}"
echo "Workspace is ${WORKSPACE}"
echo "Installs folder is ${INSTALLS_FOLDER}"

echo "Creating environment folders"
mkdir -p $WORKSPACE
mkdir -p $INSTALLS_FOLDER

sudo chown -R $ENV_USER $WORKSPACE
sudo chgrp -R $ENV_USER $WORKSPACE

sudo chown -R $ENV_USER $INSTALLS_FOLDER
sudo chgrp -R $ENV_USER $INSTALLS_FOLDER

exit
