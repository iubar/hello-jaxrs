package it.iubar.hello.resources;

import it.iubar.hello.controllers.TemperatureController;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

/**
 * Simple Hello World endpoint.
 * 
 */

@Path("temp")
public class TemperatureResource {
    
  @Inject
  private TemperatureController temperatureController;
  
    @GET
    public Response hello(){
        return Response.ok("Hello world !").build();
    }
      	
    @GET
    @Produces({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
    @Path("c")
    public Response getTemperature(){
    	String currentTemperature = this.temperatureController.getCurrentTemperatureC();      	     
        return Response.ok(currentTemperature).build();
    }
    

}