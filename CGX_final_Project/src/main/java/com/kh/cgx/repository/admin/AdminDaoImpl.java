package com.kh.cgx.repository.admin;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cgx.entity.admin.AdminDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminDto> getList() {
		return sqlSession.selectList("admin.getList");
	}

	@Override
	public void insert(AdminDto adminDto) {
		sqlSession.insert("admin.insert", adminDto);
		
	}

	@Override
	public void update(AdminDto adminDto) {
		System.out.println("adminDto="+adminDto);
		sqlSession.update("admin.update", adminDto);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("admin.delete",no);
		
	}

	@Override
	public AdminDto login(AdminDto adminDto) {

		return sqlSession.selectOne("admin.get",adminDto);
		
	}
		
	
}
		
