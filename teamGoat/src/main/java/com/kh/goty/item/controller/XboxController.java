package com.kh.goty.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class XboxController {

	@GetMapping("xboxMachine")
	public String xboxMachine() {
		
		return "item/xbox";	
	}
	
	@GetMapping("xboxGame")
	public String xboxGame() {
		
		return "item/xbox";	
	}
	
	@GetMapping("xboxAccessory")
	public String xboxAccessory() {
		
		return "item/xbox";	
	}
	
}
