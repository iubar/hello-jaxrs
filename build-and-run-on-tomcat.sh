#!/bin/bash

mvn install

sudo systemctl stop tomcat.service
sudo rm /opt/tomcat10/webapps/hello-jaxrs.war
sudo cp target/hello-jaxrs.war /opt/tomcat10/webapps/
sudo systemctl start tomcat.service

echo "Open the browser at http://192.168.0.155:8080/hello-jaxrs/"

