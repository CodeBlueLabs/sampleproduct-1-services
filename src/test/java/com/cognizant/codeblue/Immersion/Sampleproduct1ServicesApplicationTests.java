package com.cognizant.codeblue.Immersion;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Sampleproduct1ServicesApplicationTests {

	String message = "Welcome to CodeBlue Immersion Lab.";
	

	@Test
	public void welcomeToPALImmersion() {
		assertEquals(message, "Welcome to CodeBlue Immersion Lab.");
	}

	@Test
	public void welcomeToPALImmersionInvalidMessage() {
		assertNotEquals(message, "@$%@^^#&*@&#&^");

	}
}
