package com.kh.goty.item.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.dao.ItemMapper;
import com.kh.goty.item.model.dao.ItemRepository;
import com.kh.goty.item.model.vo.Item;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService{
	
	private final SqlSession sqlSession;
	private final ItemRepository itemRepository;
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
	public int addItemInCart(HashMap<String, Integer> map) {
		return itemMapper.addItemInCart(map);
	}
	@Override
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


}
