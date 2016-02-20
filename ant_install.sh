#!/bin/bash

echo "------------------------"
echo "install ant"
echo "------------------------"
echo "Operating as ${USER}"
echo "Installs folder is ${INSTALLS_FOLDER}"

export FILE_NAME=apache-ant-1.8.1-bin.tar.gz
export FILE_URL=https://archive.apache.org/dist/ant/binaries

mkdir -p ${INSTALLS_FOLDER}/apache
cd ${INSTALLS_FOLDER}/apache
rm -f $FILE_NAME
wget ${FILE_URL}/${FILE_NAME}
tar xvf $FILE_NAME

echo "ANT_HOME=$INSTALLS_FOLDER/apache/apache-ant-1.8.1" >> ${WORKSPACE}/env_variables
echo "PATH=\${ANT_HOME}/bin:\${PATH}" >> ${WORKSPACE}/path

exit
