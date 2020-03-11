package com.kh.cgx.repository.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.VideoDto;
import com.kh.cgx.vo.movie.VideoVO;
@Repository
public class VideoDaoImpl implements VideoDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<VideoVO> getList(VideoVO videoVO) {
		
		return sqlSession.selectList("movies.video_list");
	}

	@Override
	public List<VideoVO> getListInfo(VideoVO videoVO) {
		
		return sqlSession.selectList("movies.info_trailer", videoVO.getMovie_no());
	}

	@Override
	public List<VideoVO> getList2(VideoVO videoVO) {
		
		return sqlSession.selectList("movies.video_list");
	}

}
