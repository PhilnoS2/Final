package com.kh.goty.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class XboxController {
	
	// 메서드는 동사형으로 
	
	@GetMapping("xboxMachine")
	public String findXboxMachine() {
		
		return "item/xbox/machine";	
	}
	
	@GetMapping("xboxGame")
	public String findXboxGame() {
		
		return "item/xbox/game";	
	}
	
	@GetMapping("xboxAccessory")
	public String findXboxAccessory() {
		
		return "item/xbox/accessory";	
	}
	
}
