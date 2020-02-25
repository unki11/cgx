package com.kh.cgx.repository.movie;

import java.util.HashMap;	
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.vo.movie.AgeVO;
import com.kh.cgx.vo.movie.MovieActorVO;
import com.kh.cgx.vo.movie.MovieVO;
import com.kh.cgx.vo.movie.StillcutVO;


import com.kh.cgx.entity.movie.MovieVO2;


@Repository
public class MovieDaoImpl implements MovieDao{

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SqlSession sqlSession;
	
//	무비차트
	@Override
	public List<MovieDto> getList3() {
		return sqlSession.selectList("movies.list");
	}

//	상영 예정작
	@Override
	public List<MovieDto> getList2() {
		return sqlSession.selectList("movies.pre_list");
	}

	//게시글 전체 목록 + 검색 기능
	@Override
	public List<MovieDto> finder(MovieVO2 movieVO) {
		//검색 옵션 , 키워드 맵에 저장
		return sqlSession.selectList("movies.finder_list", movieVO);
	}

	//게시글 검색 결과 수
//	@Override
//	public int count(String type, Object keyword) {
//		//검색 옵션 , 키워드 맵에 저장
//		
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("type", type);
//		param.put("keyword", keyword);
//		
//		return sqlSession.selectOne("movies.count", param);
//	}

//	해당 영화 배우 리스트
	@Override
	public List<String> getList4(int movie_no) {
		return sqlSession.selectList("movies.actorList",movie_no);

	}
	
//	무비 파인더 검색창
	@Override
	public List<MovieVO2> getList5() {
		return sqlSession.selectList("movies.movieSearch");
	}
//위시 리스트
	@Override
	public void insert(int member_no, int movie_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_no", member_no);
		param.put("movie_no", movie_no);
		sqlSession.insert("movies.wishinsert", param);
		
	}

	public List<MovieVO> getList6() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("movie.whishmember");
	}
//	스틸컷
	@Override
	public List<StillcutVO> getStillcut(StillcutVO stillcutVO) {
		
		return sqlSession.selectList("movies.stillcut", stillcutVO.getMovie_no());
	}

	@Override
	public List<AgeVO> getAgeList(int movie_no) {
		
		return sqlSession.selectList("movies.ageCount",movie_no);
		
	}





	
}


