package com.cognizant.codeblue.Immersion;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.cognizant.codeblue.Immersion.controller.WelcomeController;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Sampleproduct1ServicesApplicationTests {
	
	@Autowired
	WelcomeController welcomeController;

	String message = "Welcome to CodeBlue Immersion Lab.";

	@Test
	public void welcomeToPALImmersion() {
		String response = welcomeController.welcomeToPALImmersion();
		assertEquals(message, response);
	}

	@Test
	public void welcomeToPALImmersionInvalidMessage() {
		message = "@$%@^^#&*@&#&^";
		String response = welcomeController.welcomeToPALImmersion();
		assertNotEquals(message, response);

	}
}
