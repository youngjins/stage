package kr.co.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExampleController {
	
	
	@RequestMapping(value = "/example", method = RequestMethod.GET)
	public String test() {
		
		return "example";
	}
}
