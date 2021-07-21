#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

HOST=127.0.0.1
HOST_PORT=8080

WAR_FILE=hello-jaxrs.war
PAYARA_VER=5.2021.2
WORKSPACE=${MY_PATH}/..

cd ${WORKSPACE}
mvn clean package
wget -O target/payara-micro-5.jar https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/${PAYARA_VER}/payara-micro-${PAYARA_VER}.jar
java -jar target/payara-micro-5.jar --deploy ${WAR_FILE}
cd ${MY_PATH}
