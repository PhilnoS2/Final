package com.kh.goty.item.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.goty.item.model.dao.ItemRepository;

@Service
public class ItemService {
	
	private SqlSession sqlSession;
	
	private ItemRepository itemRepository;
	
	public int findMachineCount() {
		
		return itemRepository.findMachineCount(sqlSession);
	}

}
