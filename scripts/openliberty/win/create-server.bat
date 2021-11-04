@echo off

CALL env.bat

CALL %LIBERTY_ROOT%\bin\server.bat create %LIBERTY_SERVER_NAME%
