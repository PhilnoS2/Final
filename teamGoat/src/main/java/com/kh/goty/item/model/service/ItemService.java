package com.kh.goty.item.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.item.model.dao.ItemRepository;
import com.kh.goty.item.model.vo.Item;

@Service
public class ItemService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ItemRepository itemRepository;
	
	// List Count용 - 반환  int)
	public int findMachineCount(String platform) {
		return itemRepository.findMachineCount(sqlSession, platform);
	}
	
	public List<Item> findMachineList(String platform, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset ,pi.getBoardLimit());
		
		return itemRepository.findMachineList(sqlSession, platform , rowBounds);
	}

}
