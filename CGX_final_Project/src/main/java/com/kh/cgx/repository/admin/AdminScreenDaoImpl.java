package com.kh.cgx.repository.admin;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.entity.admin.AdminScreenDto;


public class AdminScreenDaoImpl implements AdminScreenDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AdminScreenDto> getList() {
		return sqlSession.selectList("screen.getList");
		
	}

	@Override
	public void insert(AdminScreenDto screenDto) {
		sqlSession.insert("screen.insert", screenDto);
		
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("screen.delete", no);
		
	}

	@Override
	public List<AdminScreenDto> search(int no) {
		return sqlSession.selectList("screen.search",no);
		
	}

}
