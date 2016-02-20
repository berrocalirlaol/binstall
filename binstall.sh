#!/bin/bash

export PASSW=$1
export ENV_USER=$USER
export WORKSPACE=$HOME/projects/nexage

. app.properties
. app.commands

function get_property() {
        export key=$1
        export $2=${!key}
}

function create_folders() {
	if [ $# -ne 1 ]
	then
    	   echo "Need to provide user's ${USER} password"
	fi
	echo $PASSW | sudo -S bash ./create_folders.sh $ENV_USER $WORKSPACE $DEFAULT_INSTALL_FOLDER
}

function reset_properties() {
	cd $WORKSPACE
	rm -f ./path
	rm -f ./env_variables
}

function install() {
	get_property ${1}_file_name FILE_NAME
	get_property ${1}_file_ext FILE_EXT
	get_property ${1}_file_url FILE_URL
	get_property ${1}_install_folder INSTALL_FOLDER
	INSTALL_COMMAND_KEY=${1}_install_command
	SET_HOME_COMMAND_KEY=${1}_set_home
	SET_PATH_COMMAND_KEY=${1}_set_path

	echo "------------------------"
        echo "install ${FILE_NAME}"
        echo "------------------------"
        echo "Operating as ${USER}"
        echo "Installs folder is ${INSTALL_FOLDER}"

	cd ${INSTALL_FOLDER}
        rm -f "${FILE_NAME}.${FILE_EXT}"
        wget ${FILE_URL}/${FILE_NAME}.${FILE_EXT}
	eval "${!INSTALL_COMMAND_KEY}"
	#"$(${!property})"
	
	cd ${WORKSPACE}
	eval "${!SET_HOME_COMMAND_KEY}"
	eval "${!SET_PATH_COMMAND_KEY}"
}


function install_maven() {
	export FILE_NAME=apache-maven-3.3.9-bin
	export FILE_EXT=tar.gz
	export FILE_URL=http://download.nextag.com/apache/maven/maven-3/3.3.9/binaries
	export INSTALL_COMMAND='tar xvf ${FILE_NAME}.${FILE_EXT}'
	export INSTALL_FOLDER=${DEFAULT_INSTALL_FOLDER}/apache
	mkdir -p ${INSTALL_FOLDER}
	install_app
	echo "M2_HOME=${INSTALL_FOLDER}/apache/apache-maven-3.3.9" >> ${WORKSPACE}/env_variables
	echo "PATH=\${M2_HOME}/bin:\${PATH}" >> ${WORKSPACE}/path
}

function install_ant() {
	export FILE_NAME=apache-ant-1.8.1-bin
	export FILE_EXT=tar.gz
	export FILE_URL=https://archive.apache.org/dist/ant/binaries
	export INSTALL_COMMAND='tar xvf ${FILE_NAME}.${FILE_EXT}'
        export INSTALL_FOLDER=${DEFAULT_INSTALL_FOLDER}/apache
	mkdir -p ${INSTALL_FOLDER}
	install_app
	echo "ANT_HOME=$INSTALLS_FOLDER/apache/apache-ant-1.8.1" >> ${WORKSPACE}/env_variables
	echo "PATH=\${ANT_HOME}/bin:\${PATH}" >> ${WORKSPACE}/path
}


