@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%
ECHO Running from %mypath%

CALL %mypath%\env.bat

CD %WORKSPACE%

CALL mvn -f %POM_FILE% clean test
 
CD %mypath%
