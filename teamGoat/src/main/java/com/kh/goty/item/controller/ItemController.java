package com.kh.goty.item.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.item.model.service.ItemService;
import com.kh.goty.item.model.vo.Item;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ItemController {

	private final ItemService itemService;
	
	//-----------------------------------------------------------------------------------------------
	// Nintendo Controller
	@GetMapping("nintendo.machine")
	public ModelAndView findNintendoMachine(@RequestParam(value="page", defaultValue="1")
										    int page,
										    String platform,
										    ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(platform),
											 page,
											 8,
											 5);

		List<Item> itemList = itemService.findMachineList(platform,pi);

		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/nintendo");
		
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
		
		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/nintendo");
		
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
		
		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/nintendo");
		
		return mv;	
	}
	
	
	//------------------------------------------------------------------------------------------
	//PlayStation Controller
	
	@GetMapping("playstation.machine")
	public ModelAndView findPlaystationMachine(@RequestParam(value="page", defaultValue="1")
											   int page,
											   String platform,
											   ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(platform),
											 page,
											 8,
											 5);

		List<Item> itemList = itemService.findMachineList(platform,pi);

		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/playstation");
		
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
		
		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/playstation");
		
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
		
		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/playstation");
		
		return mv;	
	}
	
	//----------------------------------------------------------------------------------------------
	// XBox
	@GetMapping("xbox.machine")
	public ModelAndView findXboxMachine(@RequestParam(value="page", defaultValue="1")
									    int page,
									    String platform,
									    ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(itemService.findMachineCount(platform),
											 page,
											 8,
											 5);

		List<Item> itemList = itemService.findMachineList(platform,pi);

		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/xbox");
		
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
		
		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/xbox");
		
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
		
		mv.addObject("platform", platform)
		  .addObject("pageInfo", pi)
		  .addObject("itemList", itemList)
		  .setViewName("item/xbox");
		
		return mv;	
	}
	
	//----------------------------------------------------------------------------------------------
	// Find Item Controller
	@GetMapping("detail.item")
	public ModelAndView findNintendoDetail(int itemNo,
									       int platformNo,
										   ModelAndView mv) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("itemNo", itemNo);
		map.put("platformNo", platformNo);
		
		Item item = itemService.findItemDetail(map);
		
		mv.addObject("item", item)
		  .setViewName("item/itemDetail");
		
		return mv;
	}
	
	//----------------------------------------------------------------------------------------------
	// Cart Select Controller
	@GetMapping("cart")
	public ModelAndView findItemListInCart(int memberNo,
									 	   ModelAndView mv) {
	
		mv.addObject("itemList", itemService.findItemListInCart(memberNo))
		  .setViewName("item/itemCart");
		
		return mv;
		
	}
	
	//---------------------------------------------------------------------------------------------
	@GetMapping("insert.cart")
	public ModelAndView addItemInCart(int itemNo,
									  int memberNo,
									  int platformNo,
									  ModelAndView mv) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("itemNo", itemNo);
		map.put("memberNo", memberNo);
		map.put("platformNo", platformNo);

		if(itemService.addItemInCart(map) > 0) {
			
			mv.setViewName("redirect:cart?memberNo=" + memberNo);
			
			return mv;
			
		} else {
			
			mv.addObject("errorMsg", "장바구니 목록 추가에 실패했습니다.")
			  .setViewName("common/errorPage");
			
			return mv;
		}
	}
	
	// Cart Delete Controller
	@GetMapping("delete.cart")
	public ModelAndView deleteItemInCart(int itemNo,
										 int memberNo,
										 int platformNo,
										 ModelAndView mv) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("itemNo", itemNo);
		map.put("memberNo", memberNo);
		map.put("platformNo", platformNo);
		
		if(itemService.deleteItemInCart(map) > 0) {
			
			mv.setViewName("redirect:cart?memberNo=" + memberNo);
			
			return mv;
			
		} else {
			
			mv.addObject("errorMsg", "장바구니 목록 삭제에 실패했습니다.")
			  .setViewName("common/errorPage");
			
			return mv;
		}
		
		
	}
	
	@GetMapping("purchase.item")
	public ModelAndView addItemInOrder(int itemNo,
									   int platformNo,
									   ModelAndView mv) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("itemNo", itemNo);
		map.put("platformNo", platformNo);
		
		mv.addObject(itemService.findItemDetail(map))
		  .setViewName("item/purchaseItem");
		
		return mv;
	}
	
}
