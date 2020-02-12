package com.kh.cgx.repository.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.mypage.WatchedVO;

@Repository
public class WatchedDaoImpl implements WatchedDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WatchedVO> getList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mypage.watched");
	}

	
	
}
