@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%
ECHO Running from %mypath%

CALL %mypath%\env.bat

CD %WORKSPACE%

CALL mvn -f %POM_FILE% -Dmaven.test.skip=true clean package

IF %ERRORLEVEL% NEQ 0 EXIT 1

REM creo una copia del war così poi posso eseguire "mvn clean test" altrimenti la cartella "target" sarebbe bloccata dai processi di Payara

ECHO Copying %WORKSPACE%\target\%WAR_FILE% to %LIBERTY_FOLDER%\dropins\%WAR_FILE% ...
COPY %WORKSPACE%\target\%WAR_FILE% %LIBERTY_FOLDER%\dropins\%WAR_FILE%

CD %mypath%