package com.kh.cgx.repository.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao{

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieDto> getList3() {
		return sqlSession.selectList("movies.list");
	}

	@Override
	public List<MovieDto> getList2() {
		
		return sqlSession.selectList("movies.pre_list");
	}

	//게시글 전체 목록 + 검색 기능
	@Override
	public List<MovieDto> finder(String type, Object keyword) {
		//검색 옵션 , 키워드 맵에 저장
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectList("movies.finder_list", param);
	}

	//게시글 검색 결과 수
	@Override
	public int count(String type, Object keyword) {
		//검색 옵션 , 키워드 맵에 저장
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("movies.count", param);
	}

	
	
	}


