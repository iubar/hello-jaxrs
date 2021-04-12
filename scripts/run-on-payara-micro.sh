#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
echo "$MY_PATH"

cd $MY_PATH/..
mvn clean install
cd target
wget -O payara-micro-5.jar https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.2/payara-micro-5.2021.2.jar
java -jar payara-micro-5.jar --deploy hello-jaxrs.war
cd $MY_PATH
