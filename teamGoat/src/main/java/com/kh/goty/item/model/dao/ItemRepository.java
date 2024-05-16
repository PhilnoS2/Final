package com.kh.goty.item.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.goty.item.model.vo.Item;

@Repository
public class ItemRepository {

	public int findMachineCount(SqlSession sqlSession, String platform) {
		return sqlSession.selectOne("itemMapper.findMachineCount", platform);
	}
	
	public int findGameCount(SqlSession sqlSession, String platform) {
		return sqlSession.selectOne("itemMapper.findGameCount", platform);
	}
	
	public int findAccessoryCount(SqlSession sqlSession, String platform) {
		return sqlSession.selectOne("itemMapper.findAccessoryCount", platform);
	}

	public List<Item> findMachineList(SqlSession sqlSession, String platform, RowBounds rowBounds) {
		return sqlSession.selectList("itemMapper.findMachineList", platform, rowBounds);
	}
}
