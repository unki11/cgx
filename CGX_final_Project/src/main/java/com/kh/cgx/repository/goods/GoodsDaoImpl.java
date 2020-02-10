package com.kh.cgx.repository.goods;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.goods.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDto> getList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.list");
	}

	@Override
	public List<GoodsDto> getList2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.list2");
	}	

	
	}

