package com.kh.cgx.repository.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.VideoDto;
@Repository
public class VideoDaoImpl implements VideoDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<VideoDto> getList() {
		
		return sqlSession.selectList("movies.video_list");
	}

}
