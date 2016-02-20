#!/bin/bash

echo "------------------------"
echo "install ant-installer"
echo "------------------------"
echo "Operating as ${USER}"
echo "Installs folder is ${INSTALLS_FOLDER}"

export FILE_NAME=AntInstaller-selfextract-beta0.8.jar
export FILE_URL=https://sourceforge.net/projects/antinstaller/files/AntInstaller/beta%200.8

cd ${INSTALLS_FOLDER}
rm -f $FILE_NAME
wget ${FILE_URL}/${FILE_NAME}
tar xvf $FILE_NAME

echo "ANTINSTALLER_HOME=$INSTALLS_FOLDER/ANTinstaller" >> ${WORKSPACE}/env_variables
echo "PATH=\${ANTINSTALLER_HOME}/bin:\${PATH}" >> ${WORKSPACE}/path

exit
