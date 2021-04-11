#!/bin/bash

cd /opt/openliberty21/wlp
sudo bin/server start myServer

# http://192.168.0.155:9080/
#
# Apps drop-in folder: /opt/openliberty21/wlp/usr/servers/myServer/dropins
# Hot Deployment https://ralph.blog.imixs.com/2020/03/26/openliberty-and-hot-deployment/