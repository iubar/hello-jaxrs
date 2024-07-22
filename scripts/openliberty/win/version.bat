@echo off

SETLOCAL

CALL env.bat

CALL %LIBERTY_ROOT%\bin\server.bat version
