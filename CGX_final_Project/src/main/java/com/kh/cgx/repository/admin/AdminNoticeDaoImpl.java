package com.kh.cgx.repository.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.entity.admin.AdminNoticeDto;

public class AdminNoticeDaoImpl implements AdminNoticeDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(AdminNoticeDto noticeDto) {
		sqlSession.insert("notice.insert", noticeDto);
	}
	
}
		
