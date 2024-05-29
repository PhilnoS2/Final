package com.kh.goty.item.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.vo.Item;
import com.kh.goty.item.model.vo.Purchase;

public interface ItemService {
	
	int findMachineCount(String platform);
	
	int findGameCount(String platform);
	
	int findAccessoryCount(String platform);
	
	List<Item> findMachineList(String platform, PageInfo pi);
	
	List<Item> findGameList(String platform, PageInfo pi);
	
	List<Item> findAccessoryList(String platform, PageInfo pi);
	
	Item findItemDetail(HashMap<String, Integer> map);
	
	int addItemInCart(HashMap<String, Integer> map);
	
	int deleteItemInCart(HashMap<String, Integer> map);
	
	List<Item> findItemListInCart(int memberNo);
	
	int findCartList(HashMap<String, Integer> map);
	
	int addItemInPurchase(Purchase pc);
	
	Purchase findItemInPurchase(int memberNo);
}
