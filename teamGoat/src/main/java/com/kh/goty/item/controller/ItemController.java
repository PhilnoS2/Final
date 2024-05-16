package com.kh.goty.item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.item.model.service.ItemService;
import com.kh.goty.item.model.vo.Item;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@GetMapping("nintendo.machine")
	public ModelAndView findNintendoMachine(@RequestParam(value="page", defaultValue="1")
									  int page,
									  String platform,
									  ModelAndView mv
									  ) {
		 
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(platform),
											 page,
											 8,
											 5);

		List<Item> itemList = itemService.findMachineList(platform,pi);
		
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/nintendo/machine");
		
		return mv;	
	}
	
	@GetMapping("nintendo.game")
	public String findNintendoxboxGame() {
		
		return "item/nintendo/game";	
	}
	
	@GetMapping("nintendoAccessory")
	public String findNintendoAccessory() {
		
		return "item/nintendo/accessory";	
	}
}
