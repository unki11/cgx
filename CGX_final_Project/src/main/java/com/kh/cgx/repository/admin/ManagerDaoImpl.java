package com.kh.cgx.repository.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.entity.admin.ManagerDto;


public class ManagerDaoImpl implements ManagerDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ManagerDto managerDto) {
		sqlSession.insert("manager.insert", managerDto);
		
	}
	
}
