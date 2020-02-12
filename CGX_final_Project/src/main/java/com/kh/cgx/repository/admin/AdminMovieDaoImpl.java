package com.kh.cgx.repository.admin;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.admin.AdminMovieDto;



@Repository
public class AdminMovieDaoImpl implements AdminMovieDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminMovieDto> getList() {
		return sqlSession.selectList("movies.getList");
	
	}

	@Override
	public void insert(AdminMovieDto movieDto) {
		
		sqlSession.insert("movies.insert",movieDto);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("movies.delete", no);
		
	}

	@Override
	public void update(AdminMovieDto movieDto) {
		sqlSession.update("movies.update", movieDto);
		
	};
	
}

		
