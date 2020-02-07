package com.kh.cgx.repository.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.mypage.TicketDto;

@Repository
public class TicketDaoImpl implements TicketDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TicketDto> getList() {
		return sqlSession.selectList("mypage.list") ;
	}

}
