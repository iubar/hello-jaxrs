#!/bin/bash

HTTP_CODE=$(curl --insecure --location --silent --show-error --output /dev/null --write-out "%{http_code}" http://${HOST}:9080/${ROUTE})
if [ $HTTP_CODE = 200 ]; then
	echo "INFO: response code is $HTTP_CODE"
else
	echo "ERROR: response code is $HTTP_CODE"
	exit 1
fi
