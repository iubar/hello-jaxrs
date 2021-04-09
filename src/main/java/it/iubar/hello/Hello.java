package it.iubar.hello;

import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;

/**
 * Simple Hello World endpoint.
 * 
 */

@Path("hello")
public class Hello {
    
    @GET
    public Response hello(){
        return Response.ok("Hello world !").build();
    }
    
    @GET
    @Path("{name}")
    public Response hello(@PathParam("name") String name){
    	String output = "Hello " + name +  " !";
        return Response.ok(output).build();
    }
 
}