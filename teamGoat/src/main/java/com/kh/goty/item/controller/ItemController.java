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
	
	//-----------------------------------------------------------------------------------------------
	// Nintendo Controller
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

		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/nintendo");
		
		return mv;	
	}
	
	@GetMapping("nintendo.game")
	public ModelAndView findNintendoxboxGame(@RequestParam(value="page", defaultValue="1")
									   int page,
									   String platform,
									   ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findGameCount(platform),
				 page,
				 8,
				 5);
		
		List<Item> itemList = itemService.findGameList(platform,pi);
		
		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/nintendo");
		
		return mv;	
	}
	
	@GetMapping("nintendo.accessory")
	public ModelAndView findNintendoAccessory(@RequestParam(value="page", defaultValue="1")
									    int page,
									    String platform,
									    ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findAccessoryCount(platform),
				 page,
				 8,
				 5);
		
		List<Item> itemList = itemService.findAccessoryList(platform,pi);		
		
		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/nintendo");
		
		return mv;	
	}
	
	@GetMapping("detail.item")
	public ModelAndView findNintendoDetail(int itemNo,
										   ModelAndView mv) {
		
		mv.setViewName("");
		
		return mv;
	}
	
	
	//------------------------------------------------------------------------------------------
	//PlayStation Controller
	
	@GetMapping("playstation.machine")
	public ModelAndView findPlaystationMachine(@RequestParam(value="page", defaultValue="1")
									  int page,
									  String platform,
									  ModelAndView mv
									  ) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(platform),
											 page,
											 8,
											 5);

		List<Item> itemList = itemService.findMachineList(platform,pi);

		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/playstation");
		
		return mv;	
	}
	
	@GetMapping("playstation.game")
	public ModelAndView findPlaystationGame(@RequestParam(value="page", defaultValue="1")
									   int page,
									   String platform,
									   ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findGameCount(platform),
				 page,
				 8,
				 5);
		
		List<Item> itemList = itemService.findGameList(platform,pi);
		
		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/playstation");
		
		return mv;	
	}
	
	@GetMapping("playstation.accessory")
	public ModelAndView findPlaystationAccessory(@RequestParam(value="page", defaultValue="1")
									    int page,
									    String platform,
									    ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findAccessoryCount(platform),
				 page,
				 8,
				 5);
		
		List<Item> itemList = itemService.findAccessoryList(platform,pi);		
		
		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/playstation");
		
		return mv;	
	}
	
	//----------------------------------------------------------------------------------------------
	// XBox
	@GetMapping("xbox.machine")
	public ModelAndView findXboxMachine(@RequestParam(value="page", defaultValue="1")
									  int page,
									  String platform,
									  ModelAndView mv
									  ) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(platform),
											 page,
											 8,
											 5);

		List<Item> itemList = itemService.findMachineList(platform,pi);

		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/xbox");
		
		return mv;	
	}
	
	@GetMapping("xbox.game")
	public ModelAndView findXboxGame(@RequestParam(value="page", defaultValue="1")
									   int page,
									   String platform,
									   ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findGameCount(platform),
				 page,
				 8,
				 5);
		
		List<Item> itemList = itemService.findGameList(platform,pi);
		
		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/xbox");
		
		return mv;	
	}
	
	@GetMapping("xbox.accessory")
	public ModelAndView findXboxAccessory(@RequestParam(value="page", defaultValue="1")
									    int page,
									    String platform,
									    ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findAccessoryCount(platform),
				 page,
				 8,
				 5);
		
		List<Item> itemList = itemService.findAccessoryList(platform,pi);		
		
		mv.addObject("platform", platform);
		mv.addObject("pageInfo", pi);
		mv.addObject("itemList", itemList);
		
		mv.setViewName("item/xbox");
		
		return mv;	
	}
	
}
