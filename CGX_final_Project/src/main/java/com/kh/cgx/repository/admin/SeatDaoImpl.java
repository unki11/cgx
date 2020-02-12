package com.kh.cgx.repository.admin;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.entity.admin.SeatVO;

public class SeatDaoImpl implements SeatDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SeatVO> getList() {
		return sqlSession.selectList("seat.getList");
	}

	@Override
	public void insert(SeatVO seatDto) {
		sqlSession.insert("seat.insert", seatDto);
		
	}

	@Override
	public void update(SeatVO seatDto) {
		System.out.println("seatDto="+seatDto);
		sqlSession.update("seat.update", seatDto);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("seat.delete",no);
		
	}
		
	
}
		
