#!/bin/bash
wget -O payara-micro-5.jar https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.2/payara-micro-5.2021.2.jar
mvn install
java -jar payara-micro-5.jar --deploy target/hello-jaxrs.war
