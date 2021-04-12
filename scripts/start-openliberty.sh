#!/bin/bash

cd /opt/openliberty21/wlp

sudo bin/server start myServer

sudo bin/server status myServer

sudo bin/server version myServer

sudo bin/server list

echo "Open the browser at http://192.168.0.155:9080"

# Apps drop-in folder: /opt/openliberty21/wlp/usr/servers/myServer/dropins
# Hot Deployment https://ralph.blog.imixs.com/2020/03/26/openliberty-and-hot-deployment/
# Open Liberty Cheat Sheet: https://aguibert.github.io/openliberty-cheat-sheet/
