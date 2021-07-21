@echo off

SET mypath=%~dp0
SET mypath=%mypath:~0,-1%
ECHO Running from %mypath%

CALL %mypath%\env.bat

START %LIBERTY_ROOT%\bin\server.bat start %LIBERTY_SERVER_NAME%

CD %mypath%