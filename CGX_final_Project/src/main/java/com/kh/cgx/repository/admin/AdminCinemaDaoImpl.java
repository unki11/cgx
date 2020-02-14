package com.kh.cgx.repository.admin;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.admin.AdminCinemaDto;
import com.kh.cgx.entity.cinema.CinemaDto;


@Repository
public class AdminCinemaDaoImpl implements AdminCinemaDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminCinemaDto> getList() {
		return sqlSession.selectList("cinema.getList");
	}

	@Override
	public void insert(AdminCinemaDto cinemaDto) {
		sqlSession.insert("cinema.insert", cinemaDto);
		
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("cinema.delete",no);
		
	}


	 @Override public List<CinemaDto> getCinemaList() { 
		  return sqlSession.selectList("cinema.getCinemaList"); 
	}


	/*
	 * @Override public void update(AdminCinemaDto cinemaDto) {
	 * sqlSession.update("admin.update", cinemaDto); }
	 */
		
	
}
