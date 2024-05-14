package com.kh.goty.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PlaystationController {

	@GetMapping("playstationMachine")
	public String xboxMachine() {
		
		return "item/playstation/machine";	
	}
	
	@GetMapping("playstationGame")
	public String xboxGame() {
		
		return "item/playstation/game";	
	}
	
	@GetMapping("playstationAccessory")
	public String xboxAccessory() {
		
		return "item/playstation/accessory";	
	}
	
}
