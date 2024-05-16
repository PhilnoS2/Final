package com.kh.goty.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NintendoController {

	@GetMapping("nintendoMachine")
	public String findNintendoMachine() {
		
		
	
		
		return "item/nintendo/machine";	
	}
	
	@GetMapping("nintendoGame")
	public String findNintendoxboxGame() {
		
		return "item/nintendo/game";	
	}
	
	@GetMapping("nintendoAccessory")
	public String findNintendoAccessory() {
		
		return "item/nintendo/accessory";	
	}
}
