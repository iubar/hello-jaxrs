@echo off

ECHO Running from %~dp0
CD %~dp0..
CALL mvn clean install
cd target
REM wget -O payara-micro-5.jar https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.2/payara-micro-5.2021.2.jar
java -jar %MY_APPS%\java_tools\payara\payara-micro-5.2021.2.jar --deploy hello-jaxrs.war
cd %~dp0