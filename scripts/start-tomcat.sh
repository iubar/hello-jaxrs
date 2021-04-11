#!/bin/bash

sudo systemctl start tomcat.service

# Open the browser at http://192.168.0.155:8080/hello-jaxrs/
#
# To change the port: sudo nano /opt/tomcat10/conf/server.xml
# http://192.168.0.155:8080/
# http://192.168.0.155:8080/manager/html (restricted to the "manager-gui" user)
# http://192.168.0.155:8080/host-manager/html (restricted to the "admin-gui" user)
#
# Apps drop-in folder: sudo ls /opt/tomcat10/webapps/ -la
#
# see https://tomcat.apache.org/tomcat-10.0-doc/
# see https://tecadmin.net/how-to-install-tomcat-10-on-ubuntu-20-04/


