#!/bin/bash

cd $WORKSPACE
cd functionaltest-exchange
echo yes | sudo keytool -import -trustcacerts -storepass changeit -alias bidder.sbx -file src/test/resources/bidder.sbx.cer -keystore $JAVA_HOME/jre/lib/security/cacerts

