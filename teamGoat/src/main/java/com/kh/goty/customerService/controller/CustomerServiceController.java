package com.kh.goty.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerServiceController {

	
	@GetMapping("customer-service")
	public String forward() {
		
		return "customerService/csMain";
	}
	
}
