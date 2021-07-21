@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%
ECHO Running from %mypath%

CALL %mypath%\env.bat

CD %WORKSPACE%

RD /s /q dist
MKDIR dist

CD %WORKSPACE%\dist

CALL %WGET% %ARTIFACTORY_BASE_URL%/libs-release-local/it/iubar/paghe/iubar-paghe-colf/%PARENT_PROJECT_VERSION%/iubar-paghe-colf.zip
REM %WGET% --no-check-certificate https://repo1.maven.org/maven2/javax/persistence/javax.persistence-api/2.2/javax.persistence-api-2.2.jar
REM %WGET% --no-check-certificate https://repo1.maven.org/maven2/org/eclipse/microprofile/microprofile/4.0.1/microprofile-4.0.1.pom

REM 7az.exe --help
REM e: Extract files from archive (without using directory names)
REM x: eXtract files with full paths
CALL %SEVENZIP% x *.zip
MOVE .\lib\*.jar .
RD /s /q lib
DEL iubar-paghe-colf.zip

MKDIR %LIBERTY_FOLDER%\dist
COPY *.jar %LIBERTY_FOLDER%\dist\

CD %mypath%


