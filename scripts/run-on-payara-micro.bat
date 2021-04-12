@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%

ECHO Running from %mypath%
CD %mypath%\..
CALL mvn clean install
CD target
REM wget -O payara-micro-5.jar https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.2/payara-micro-5.2021.2.jar
java -jar %MY_APPS%\java_tools\payara\payara-micro-5.2021.2.jar --deploy hello-jaxrs.war
CD ..\scripts