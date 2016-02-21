#!/bin/bash

. app.properties
. app.commands

export ENV_USER=$USER
export WORKSPACE=$HOME/projects/nexage

function _get_property() {
        export key=$1
        export $2=${!key}
}

_get_property default_install_folder INSTALL_FOLDER

function binstall_folder() {
	if [ $# -ne 2 ]
	then
    	   echo "Need to provide user's ${USER} password and install folder"
	fi

	export INSTALL_FOLDER=$1
	export PASSW=$2
	echo "created install folder ${INSTALL_FOLDER} with permissions for ${ENV_USER}"

	echo $PASSW | sudo -S mkdir -p $INSTALL_FOLDER
	echo $PASSW | sudo -S chown -R $ENV_USER $INSTALL_FOLDER
	echo $PASSW | sudo -S chgrp -R $ENV_USER $INSTALL_FOLDER
}

function reset_properties() {
	cd $WORKSPACE
	rm -f ./path
	rm -f ./env_variables
}

function uncompress() {
	case "${FILE_EXT}" in
   	   "zip") unzip ${FILE_NAME}.zip
	;;
   	   "tar.gz") tar xvf ${FILE_NAME}.tar.gz
   	;;
	   "tgz") tar xvf ${FILE_NAME}.tgz
	;;
	esac
}

function binstall() {
	export USER_FOLDER=$(pwd)
	_get_property ${1}_file_name FILE_NAME
	_get_property ${1}_file_ext FILE_EXT
	_get_property ${1}_file_url FILE_URL
	export SET_HOME_COMMAND_KEY=${1}_set_home
	export SET_PATH_COMMAND_KEY=${1}_set_path
        echo "install ${FILE_NAME}"
        echo "Operating as ${USER}"
        echo "Installs folder is ${INSTALL_FOLDER}"

	cd ${INSTALL_FOLDER}
        rm -f "${FILE_NAME}.${FILE_EXT}"
        wget ${FILE_URL}/${FILE_NAME}.${FILE_EXT}
	uncompress
	#eval "${!INSTALL_COMMAND_KEY}"
	#"$(${!property})"
	
	cd ${USER_FOLDER}
	eval "${!SET_HOME_COMMAND_KEY}"
	eval "${!SET_PATH_COMMAND_KEY}"
}

function link() {
	if [ $# -ne 3 ]
	then
    	   echo "Need to provide 1)Target folder 2)New link 3)User password"
	fi

	export TARGET_FOLDER=$1
	export LINK_FOLDER=$2
	export PASSW=$3

	echo ${PASSW} | sudo -S ln -s ${TARGET_FOLDER} ${LINK_FOLDER}
	echo ${PASSW} | sudo -S chown -R ${ENV_USER} ${LINK_FOLDER}
	echo ${PASSW} | sudo -S chgrp -R ${ENV_USER} ${LINK_FOLDER}
}
