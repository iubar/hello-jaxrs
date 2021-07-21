package it.iubar.hello.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TemperatureController {

	private final Logger LOGGER = Logger.getLogger(TemperatureController.class.getName());
	
    protected String readTemperatureFile() {        
      	String temperatureFile = "temperature.txt";
      	java.nio.file.Path path = Paths.get(temperatureFile);
      	Path absPath = path.toAbsolutePath();
      	LOGGER.log(Level.INFO, "Reading " + absPath + " ...");
      	String currentTemperature = null;
      	try (BufferedReader reader = Files.newBufferedReader(path, Charset.forName("UTF-8"))) {      
          	String currentLine = null;
          	while ((currentLine = reader.readLine()) != null) {//while there is content on the current line
              currentTemperature = currentLine;
          	}
      	} catch (IOException ex) {
      		LOGGER.log(Level.SEVERE, ex.getMessage());
      	}
      	return currentTemperature;
      }

	public String getCurrentTemperatureC() {
     	String temp = readTemperatureFile();
     	String  currentTemperatureC = temp.substring(temp.indexOf(",") + 1, temp.lastIndexOf(")"));
		return currentTemperatureC;
	}
    
    
}
