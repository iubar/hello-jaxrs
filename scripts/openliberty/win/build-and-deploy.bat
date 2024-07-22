@ECHO off

SETLOCAL

CALL env.bat

CD %WORKSPACE%

CALL mvn -f %POM_FILE% -Dmaven.test.skip=true clean package
IF %ERRORLEVEL% NEQ 0 EXIT /b %ERRORLEVEL%

SET FROM=%WORKSPACE%\target\%WAR_FILE%
SET TO=%LIBERTY_FOLDER%\dropins\%WAR_FILE%

ECHO CURRENT PATH IS %CD%
ECHO Copying from %FROM% to %TO% ...
COPY %FROM% %TO%
ECHO Copying from temperature.txt to %LIBERTY_FOLDER%\ ...
COPY temperature.txt %LIBERTY_FOLDER%\

CD %mypath%