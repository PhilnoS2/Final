package com.kh.goty.item.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.vo.Item;

public interface ItemService {
	
	int findMachineCount(String platform);
	
	int findGameCount(String platform);
	
	int findAccessoryCount(String platform);
	
	List<Item> findMachineList(String platform, PageInfo pi);
	
	List<Item> findGameList(String platform, PageInfo pi);
	
	List<Item> findAccessoryList(String platform, PageInfo pi);
	
	Item findItemDetail(int itemNo);
	
	int addItemInBasket(HashMap<String, Integer> map);
	
}
