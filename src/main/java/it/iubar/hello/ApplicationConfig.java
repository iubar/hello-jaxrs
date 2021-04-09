package it.iubar.hello;

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
//        set.add(Hello.class);
//        return set;
//    }

}
