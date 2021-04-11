#!/bin/bash

export JETTY_HOME=/opt/jetty11
# java -jar $JETTY_HOME/start.jar --add-module=server,http,deploy
java -jar $JETTY_HOME/start.jar

# To change the port number: sudo nano /opt/jetty11/start.d/http.ini
# open the browser at http://192.168.0.155:8081/hello-jaxrs/
# Apps drop-in folder: sudo ls /opt/jetty11/webapps/
# Docs: https://www.eclipse.org/jetty/documentation/jetty-11/operations_guide.php
