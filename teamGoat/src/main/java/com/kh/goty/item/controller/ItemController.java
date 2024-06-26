package com.kh.goty.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.item.model.service.ItemService;
import com.kh.goty.item.model.vo.Item;
import com.kh.goty.item.model.vo.Order;
import com.kh.goty.item.model.vo.Purchase;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
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
									  HttpSession session,
									  ModelAndView mv) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("itemNo", itemNo);
		map.put("memberNo", memberNo);
		map.put("platformNo", platformNo);
		
		if(itemService.findCartList(map) > 0) {
			
			session.setAttribute("alertMsg", "이미 장바구니에 포함된 상품입니다.");
			mv.setViewName("redirect:detail.item?platformNo=" + platformNo + "&itemNo=" + itemNo);
			return mv;
			
		} else {
			
			if(itemService.addItemInCart(map) > 0) {
				
				mv.setViewName("redirect:cart?memberNo=" + memberNo);
				return mv;
				
			} else {
				
				mv.addObject("errorMsg", "장바구니 목록 추가에 실패했습니다.")
				  .setViewName("common/errorPage");
				return mv;
			}
			
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
	
	@GetMapping("item.order")
	public ModelAndView showOrder(int itemNo,
								  int platformNo,
								  ModelAndView mv) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("itemNo", itemNo);
		map.put("platformNo", platformNo);
		
		mv.addObject(itemService.findItemDetail(map))
		  .setViewName("item/itemOrder");
		return mv;
	}
	
	// 결제 관련 페이지 - item.result까지 묶어서 
	@PostMapping("item.process")
	public ModelAndView addOrder(int memberNo,
								     int itemNo,
								     String toName,
								     String toContact,
								     String toEmail,
								     String address,
								     String detailAddress,
								     String message,
								     ModelAndView mv) {

		Order order = new Order();
		
		order.setMemberNo(memberNo);
		order.setItemNo(itemNo);
		order.setToName(toName);
		order.setToContact(toContact);
		order.setToEmail(toEmail);
		order.setAddress(address);
		order.setDetailAddress(detailAddress);
		order.setMessage(message);
		
		if(itemService.addOrder(order) > 0) {
			
			mv.setViewName("redirect:item.purchase?memberNo="+memberNo);
			return mv;
			
		} else {
			
			mv.addObject("errorMsg", "ㅈ댐")
			  .setViewName("common/errorPage");
			return mv;
			
		}

	}

	@GetMapping("item.purchase")
	public ModelAndView findOrderList(int memberNo, 
									  ModelAndView mv) {
		
		List<Order> orderList = itemService.findOrderList(memberNo);
		
		mv.addObject("orderList", orderList)
		  .setViewName("item/itemPurchase");
		return mv;
	}
	
	@PostMapping("item.result")
	public ModelAndView addPurchase(int memberNo,
									int usePoint,
									double addPoint,
									int totalPrice,
									String orderNo,
									ModelAndView mv) {

		Purchase purchaseInt = new Purchase();
		
		purchaseInt.setMemberNo(memberNo);
		purchaseInt.setUsePoint(usePoint);
		purchaseInt.setAddPoint((int)Math.ceil(addPoint));
		purchaseInt.setTotalPrice(totalPrice);
		
		// Purchase Insert용
		int insertResult = itemService.addPurchase(purchaseInt);
		// Purchase Select용
		Purchase purchase = itemService.findPurchase(memberNo);
		int purchaseNo = purchase.getPurchaseNo(); 
		
 		//----------Order Bridge------------------------
		
		String orderNoList = orderNo;
		
		StringTokenizer st = new StringTokenizer(orderNoList , ",");
		
		int[] dataArr = new int[st.countTokens()];
		
		int i = 0;
		
		List<Integer> orderNum = new ArrayList<Integer>();
		
		while(st.hasMoreTokens()) {
			
			dataArr[i] = Integer.parseInt(st.nextToken());
			orderNum.add(dataArr[i]);
			i++;
			
		}
		
		if(insertResult > 0) {
			
			List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
			
			for(int j = 0; orderNum.size() > j; j++) {
				Map<String, Object> map = new HashMap<String, Object>();	
				map.put("purchaseNo", purchaseNo);
				map.put("orderNo", orderNum.get(j));
				mapList.add(map);
			}
			
			int bridgeResult = itemService.addOrderPurchaseBridge(mapList);
			
			if(bridgeResult > 0) {
				
				if(itemService.updatePurchaseAndOrder(purchaseNo, orderNum) > 0) {
					
					mv.addObject("purchaseNo", purchaseNo)
					  .setViewName("redirect:item.paid");
					return mv;
					
				}
				
				mv.addObject("errorMsg", "제품 구매에 실패하셨습니다.")
				  .setViewName("common/errorPage");
				return mv;
				
			} else {
				
				mv.addObject("errorMsg", "제품 구매에 실패하셨습니다.")
				  .setViewName("common/errorPage");
				return mv;
				
			}
			
		} else {
			
			mv.addObject("errorMsg", "제품 구매에 실패하셨습니다.")
			  .setViewName("common/errorPage");
			return mv;
		}
		
	}
	
	@GetMapping("item.paid")
	public ModelAndView findPurchase(int purchaseNo,
									 ModelAndView mv) {
		
		Purchase purchase = itemService.findPurchaseDetail(purchaseNo);
		
		mv.addObject("purchase", purchase);
		mv.setViewName("item/itemResult");
		return mv;
	}
	
}
