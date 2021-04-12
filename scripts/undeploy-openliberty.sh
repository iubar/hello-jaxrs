#!/bin/bash

cd /opt/openliberty21/wlp

sudo rm ./usr/servers/myServer/dropins/hello-jaxrs.war
sudo rm ./usr/servers/myServer/apps/expanded/hello-jaxrs.war -rf

sudo ls -la ./usr/servers/myServer/apps/expanded/
sudo ls -la ./usr/servers/myServer/dropins/








