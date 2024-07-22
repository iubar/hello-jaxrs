@echo off

SETLOCAL

CALL env.bat

CD %WORKSPACE%

CALL mvn -f %POM_FILE% clean test
 
CD %mypath%
