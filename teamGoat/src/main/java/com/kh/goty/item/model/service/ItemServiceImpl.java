package com.kh.goty.item.model.service;

import java.util.List;

<<<<<<< HEAD
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.vo.Item;

public interface ItemService {

	int findMachineCount(String platform);
	
	int findGameCount(String platform);
	
	int findAccessoryCount(String platform);
	
	List<Item> findMachineList(String platform, PageInfo pi);
	
	List<Item> findGameList(String platform, PageInfo pi);
	
	List<Item> findAccessoryList(String platform, PageInfo pi);
=======
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.dao.ItemRepository;
import com.kh.goty.item.model.vo.Item;

@Service
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ItemRepository itemRepository;
	
	// List Count용 - 반환  int)
	@Override
	public int findMachineCount(String platform) {
		return itemRepository.findMachineCount(sqlSession, platform);
	}
	
	@Override
	public int findGameCount(String platform) {
		return itemRepository.findGameCount(sqlSession, platform);
	}
	
	@Override
	public int findAccessoryCount(String platform) {
		return itemRepository.findAccessoryCount(sqlSession, platform);
	}
	
	@Override
	public List<Item> findMachineList(String platform, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset ,pi.getBoardLimit());
		
		return itemRepository.findMachineList(sqlSession, platform , rowBounds);
	}

	@Override
	public List<Item> findGameList(String platform, PageInfo pi) {
		return null;
	}

	@Override
	public List<Item> findAccessoryList(String platform, PageInfo pi) {
		return null;
	}

>>>>>>> parent of 251d263 (Revert "qwe")
}
