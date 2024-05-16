package com.kh.goty.item.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ItemRepository {

	public int findMachineCount(SqlSession sqlSession) {
		return sqlSession.selectOne("itemMapper.findMachineCount()");
	}
	
}
