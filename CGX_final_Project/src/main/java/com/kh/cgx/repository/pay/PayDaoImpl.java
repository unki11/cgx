package com.kh.cgx.repository.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.entity.pay.PayDto;

public class PayDaoImpl implements PayDao{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertReady(PayDto payDto) {
		sqlSession.insert("pay.ready",payDto);
	}

	@Override
	public void insertSuccess(PayDto payDto) {

		sqlSession.insert("pay.success",payDto);
	}

	@Override
	public List<PayDto> getList() {
		
		return sqlSession.selectList("pay.list");
	}

	@Override
	public PayDto get(int no) {
		return sqlSession.selectOne("pay.get",no);
	}

	@Override
	public void insertRevoke(PayDto payDto) {
		sqlSession.insert("pay.revoke",payDto);
	}

}
