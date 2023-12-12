@echo off

CALL env.bat

CALL %LIBERTY_ROOT%\bin\server.bat start %LIBERTY_SERVER_NAME%  --clean
CALL %LIBERTY_ROOT%\bin\server.bat status %LIBERTY_SERVER_NAME% 
CALL %LIBERTY_ROOT%\bin\server.bat version
CALL %LIBERTY_ROOT%\bin\server.bat list

ECHO OPEN http://localhost:9080/hello-jaxrs/hello