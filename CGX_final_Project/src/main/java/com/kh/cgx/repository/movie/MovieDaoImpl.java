package com.kh.cgx.repository.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao{


	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieDto> getList() {
		return sqlSession.selectList("movies.list");
	}

	@Override
	public List<MovieDto> getList2() {
		
		return sqlSession.selectList("movies.pre_list");
	}

	
	}


