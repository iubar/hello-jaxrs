@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%
ECHO Running from %mypath%

CALL %mypath%\env.bat

START %LIBERTY_ROOT%\bin\server.bat create %LIBERTY_SERVER_NAME%
