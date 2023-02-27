# hello-jaxrs

A JAX-RS example

Snapshot:
* http://192.168.0.119:8081/artifactory/libs-snapshot-local/it/iubar/hello-jaxrs

Release:
* http://192.168.0.119:8081/artifactory/libs-release-local/it/iubar/hello-jaxrs/

* http://localhost:8080/hello-jaxrs/hello
* http://localhost:8080/hello-jaxrs/hello/Borgo
* http://localhost:8080/hello-jaxrs/application.wadl

* http://localhost:4848/ (see https://blog.payara.fish/basics-of-payara-server-admin-console-1-overview-and-concept)


Doc

https://jakarta.ee/specifications/xml-web-services/4.0/


Install 
<pre>
cd scripts\openliberty\win
create-server.bat
build-and-deploy.bat
start.bat
</pre>


Routes:

http://localhost:9080/hello-jaxrs/hello
http://localhost:9080/hello-jaxrs/temp
http://localhost:9080/hello-jaxrs/temp/c
