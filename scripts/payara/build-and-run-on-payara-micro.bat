@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%

set HOST=127.0.0.1
set HOST_PORT=8080

SET WAR_FILE=hello-jaxrs.war
SET PAYARA_VER=5.2021.2
SET WORKSPACE=%mypath%\..\..

CD %WORKSPACE%
CALL mvn clean package
REM wget -O %MY_APPS%\java_tools\payara\payara-micro-5.jar https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.2/payara-micro-5.2021.2.jar
START java -jar %MY_APPS%\java_tools\payara\payara-micro-%PAYARA_VER%.jar --deploy %WORKSPACE%\target\%WAR_FILE%

CD %mypath%