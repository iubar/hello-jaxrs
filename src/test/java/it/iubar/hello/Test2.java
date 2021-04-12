package it.iubar.hello;

import java.net.URI;

import org.glassfish.jersey.client.ClientConfig;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Invocation.Builder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Configuration;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriBuilder;
 
	public class Test2 {

	    public static void main(String[] args) {
	    	ClientConfig config= new ClientConfig();
			Client client = ClientBuilder.newClient(config);

	        WebTarget target = client.target(getBaseURI());

	        Builder request = target.path("downloads").
                    path("pagheopen").
                    path("paghe_version.txt").
                    request();
	        String response = request.
	                            accept(MediaType.TEXT_PLAIN).
	                            get(Response.class)
	                            .toString();

	        String plainAnswer = request.accept(MediaType.TEXT_PLAIN).get(String.class);
	        String xmlAnswer = request.accept(MediaType.TEXT_XML).get(String.class);
	        String htmlAnswer= request.accept(MediaType.TEXT_HTML).get(String.class);

	        System.out.println("toString(): \n" + response);
	        System.out.println("");
	        System.out.println("TEXT_PLAIN : \n" + plainAnswer);
	        System.out.println("");
	        System.out.println("TEXT_XML: \n" + xmlAnswer);
	        System.out.println("");
	        System.out.println("TEXT_HTML: \n" + htmlAnswer);
	        
	    }

	    private static URI getBaseURI() {
	        return UriBuilder.fromUri("https://www.pagheopen.it").build();
	    }
 
}
