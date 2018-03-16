package com.cognizant.codeblue.Immersion.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping("/")
public class WelcomeController {
	
	@RequestMapping(value = "/api/welcome", method = RequestMethod.GET)
	public String welcomeToPALImmersion(){
		return "Welcome to CodeBlue Immersion Lab.";
	}
}
