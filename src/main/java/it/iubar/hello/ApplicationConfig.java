package it.iubar.hello;

import java.util.HashSet;
import java.util.Set;

import it.iubar.hello.resources.HelloResource;
import it.iubar.hello.resources.TemperatureResource;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
 

/**
 * Configures the Jakarta REST application.
 * 
 */
@ApplicationPath("/")
public class ApplicationConfig extends Application {
 
//    @Override
//    public Set<Class<?>> getClasses() {
//        Set<Class<?>> set = new HashSet<>();
//        set.add(HelloResource.class);
//        set.add(TemperatureResource.class);
//        return set;
//    }

}
