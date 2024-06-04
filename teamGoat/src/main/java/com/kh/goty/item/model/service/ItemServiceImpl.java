package com.kh.goty.item.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.dao.ItemMapper;
import com.kh.goty.item.model.vo.Item;
import com.kh.goty.item.model.vo.Order;
import com.kh.goty.item.model.vo.Purchase;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService{
	
	// private final SqlSession sqlSession;
	// private final ItemRepository itemRepository;
	private final ItemMapper itemMapper;
	
	// List Count용 Service - 반환  int
	@Override
	public int findMachineCount(String platform) {
		return itemMapper.findMachineCount(platform);
	}
	
	@Override
	public int findGameCount(String platform) {
		return itemMapper.findGameCount(platform);
	}
	
	@Override
	public int findAccessoryCount(String platform) {
		return itemMapper.findAccessoryCount(platform);
	}
	
	// Item List용 Service - 반환 List<Item>
	@Override
	public List<Item> findMachineList(String platform, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset ,pi.getBoardLimit());
		
		return itemMapper.findMachineList(platform, rowBounds);
	}

	@Override
	public List<Item> findGameList(String platform, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset ,pi.getBoardLimit());
		
		return itemMapper.findGameList(platform , rowBounds);
	}

	@Override
	public List<Item> findAccessoryList(String platform, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset ,pi.getBoardLimit());
		
		return itemMapper.findAccessoryList(platform , rowBounds);
	}

	//상세보기 페이지용
	@Override
	public Item findItemDetail(HashMap<String, Integer> map) {
		return itemMapper.findItemDetail(map);
	}

	// Basket Insert
	@Override
	@Transactional
	public int addItemInCart(HashMap<String, Integer> map) {
		return itemMapper.addItemInCart(map);
	}
	@Override
	@Transactional
	public int deleteItemInCart(HashMap<String, Integer> map) {
		return itemMapper.deleteItemInCart(map);
	}

	@Override
	public List<Item> findItemListInCart(int memberNo) {
		return itemMapper.findItemListInCart(memberNo);
	}

	@Override
	public int findCartList(HashMap<String, Integer> map) {
		return itemMapper.findCartList(map);
	}

	@Override
	@Transactional
	public int addOrder(Order order) {
		return itemMapper.addOrder(order);
	}

	@Override
	public List<Order> findOrderList(int memberNo) {
		return itemMapper.findOrderList(memberNo);
	}

	@Override
	@Transactional
	public int addPurchase(Purchase purchase) {
		return itemMapper.addPurchase(purchase);
	}

	@Override
	@Transactional
	public int addOrderPurchaseBridge(List<Map<String, Object>> mapList) {
		return itemMapper.addOrderPurchaseBridge(mapList);
	}

	@Override
	public Purchase findPurchase(int memberNo) {
		return itemMapper.findPurchase(memberNo);
	}

	@Override
	@Transactional
	public int updatePurchaseAndOrder(int purchaseNo, List<Integer> list) {
		
		int result1 = itemMapper.updateOrder(list);
		int result2 = itemMapper.updatePurchase(purchaseNo);
		
		return (result1 + result2) / 2;
	}


	
	

}
