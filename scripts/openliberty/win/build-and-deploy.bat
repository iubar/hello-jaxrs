@echo off

CALL env.bat

CD %WORKSPACE%

CALL mvn -f %POM_FILE% -Dmaven.test.skip=true clean package

REM IF %ERRORLEVEL% NEQ 0 EXIT 1

REM creo una copia del war così poi posso eseguire "mvn clean test" altrimenti la cartella "target" sarebbe bloccata dai processi di Payara

ECHO Copying target\%WAR_FILE% to %LIBERTY_FOLDER%\dropins\%WAR_FILE% ...

COPY temperature.txt %LIBERTY_FOLDER%\
COPY target\%WAR_FILE% %LIBERTY_FOLDER%\dropins\%WAR_FILE%

CD %mypath%