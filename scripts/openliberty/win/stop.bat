@echo off

SETLOCAL

CALL env.bat

CALL %LIBERTY_ROOT%\bin\server.bat stop %LIBERTY_SERVER_NAME%

CALL %LIBERTY_ROOT%\bin\server.bat status %LIBERTY_SERVER_NAME%
