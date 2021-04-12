#!/bin/bash

cd /opt/payara5/bin/
./asadmin start-domain

# Open the browser at http://192.168.0.155:8080/hello-jaxrs/
#
# Admin: http://192.168.0.155:4848
# To change password or port: nano domain.xml  (https://blog.payara.fish/administering-payara-server-5-with-the-cli)
# Doc: 
#   https://www.payara.fish/payara-site/media/gb/Payara-Server-5-Administration-Cheat-Sheet-English.pdf
#   https://medium.com/@mertcal/how-to-silently-change-admin-password-and-enable-secure-admin-on-payara-357a6d3dce04
#
# Apps drop-in folder: ls -la /opt/payara5/glassfish/domains/domain1/applications/
