package com.kh.goty.item.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.goty.item.model.vo.Item;
import com.kh.goty.item.model.vo.Order;
import com.kh.goty.item.model.vo.Purchase;

@Mapper
public interface ItemMapper {

	int findMachineCount(String platform);
	
	int findGameCount(String platform);
	
	int findAccessoryCount(String platform);
	
	List<Item> findMachineList(String platform, RowBounds rowBounds);
	
	List<Item> findGameList(String platform, RowBounds rowBounds);
	
	List<Item> findAccessoryList(String platform, RowBounds rowBounds);
	
	Item findItemDetail(HashMap<String, Integer> map);
	
	int addItemInCart(HashMap<String, Integer> map);
	
	int deleteItemInCart(HashMap<String, Integer> map);
	
	List<Item> findItemListInCart(int memberNo);
	
	int findCartList(HashMap<String, Integer> map);
	
	int addOrder(Order order);
	
	List<Order> findOrderList(int memberNo);
	
	int addPurchase(Purchase purchase);
	
}
