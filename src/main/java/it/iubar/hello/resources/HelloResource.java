package it.iubar.hello.resources;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

/**
 * Simple Hello World endpoint.
 * 
 */
@Path("hello")
public class HelloResource {
    
    @GET
    public Response hello(){
        return Response.ok("Hello R4 world !").build();
    }
    

    @GET
    @Path("{name}")
    public Response getHello2(@PathParam("name") String name){
    	String output = "Hello " + name +  " !";
        return Response.ok(output).build();
    }
    
    /**
     * 
     * test: curl -X POST http://localhost:8080/your-app/api/hello \
     * -H "Content-Type: text/plain" \
     * -d "Mario"
     */    
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getHello() {
        return "Hello World from GET!";
    }

    /**
     * 
     * test: curl -X GET http://localhost:8080/your-app/api/hello
     */    
    @POST
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.TEXT_PLAIN)
    public Response postHello(String name) {
        String msg = "Hello " + name + " from POST!";
        return Response.ok(msg).build();
    }
    
 
}