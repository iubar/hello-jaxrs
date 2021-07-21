@echo off

SET HOST=127.0.0.1
SET HOST_PORT=9080
SET POM_FILE=pom-payara.xml
SET WAR_FILE=iubar-paghe-jaxrs.war
SET PARENT_PROJECT_VERSION=0.0.4
SET OPENLIBERTY_VER=21.0.0.5-beta
SET WORKSPACE=%mypath%\..\..\..

SET LIBERTY_SERVER_NAME=myserver
SET LIBERTY_ROOT=%MY_APPS%\java_tools\openliberty\%OPENLIBERTY_VER%
SET LIBERTY_FOLDER=%LIBERTY_ROOT%\usr\servers\%LIBERTY_SERVER_NAME%

REM https://eternallybored.org/misc/wget/
SET WGET=%MY_APPS%\wget-1.21.1-1-win64\wget.exe

REM https://www.7-zip.org/download.html
SET SEVENZIP=%MY_APPS%\win_tools\7zip\7z1900-extra\x64\7za.exe

SET ARTIFACTORY_BASE_URL=http://192.168.0.119:8081/artifactory
