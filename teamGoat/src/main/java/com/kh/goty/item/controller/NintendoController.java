package com.kh.goty.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.item.model.service.ItemService;

@Controller
public class NintendoController {

	private ItemService itemService;
	
	@GetMapping("nintendoMachine")
	public String findNintendoMachine(@RequestParam(value="page", defaultValue="1")
									  int page
									  ) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(),
											 page,
											 8,
											 5);
	
		
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
