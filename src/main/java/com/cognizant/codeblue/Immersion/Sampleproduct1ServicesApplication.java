package com.cognizant.codeblue.Immersion;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@EnableAutoConfiguration
@CrossOrigin
public class Sampleproduct1ServicesApplication {

	public static void main(String[] args) {
		SpringApplication.run(Sampleproduct1ServicesApplication.class, args);
	}
}
