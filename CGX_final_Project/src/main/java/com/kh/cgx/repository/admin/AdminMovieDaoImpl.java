package com.kh.cgx.repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.MovieDto;

import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class AdminMovieDaoImpl implements AdminMovieDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieDto> getList() {
		return sqlSession.selectList("movies.getList");
	
	}

	@Override
	public void insert(MovieDto movieDto) {
		
		sqlSession.insert("movies.insert",movieDto);
	}

	@Override
	public void delete(int no) {

		sqlSession.delete("movies.delete", no);
		log.info("no={}",no);
		
	}

	@Override
	public void update(MovieDto movieDto) {
		sqlSession.update("movies.update", movieDto);
		
	}

	@Override
	public int file() {
		return sqlSession.selectOne("cinema.files");
	};
	
}

		
