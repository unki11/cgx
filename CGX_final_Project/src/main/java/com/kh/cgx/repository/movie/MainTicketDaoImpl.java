package com.kh.cgx.repository.movie;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.vo.movie.AddrVO;
import com.kh.cgx.vo.movie.AreaVO;
import com.kh.cgx.vo.movie.SelectMovieTimeVO;

@Repository
public class MainTicketDaoImpl implements MainTicketDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieDto> movieTitle() {
		
		return sqlSession.selectList("ticket.movie_title");
	}

	@Override
	public List<AddrVO> addrList() {
		
		return sqlSession.selectList("ticket.addrList");
	}

	@Override
	public List<AreaVO> getAreaAndCinemaList(int movie_no) {
		return sqlSession.selectList("ticket.getAreaAndCinemaList",movie_no);
	}

	@Override
	public List<SelectMovieTimeVO> timeList(SelectMovieTimeVO selectMovieTimeVO){
		
		return sqlSession.selectList("ticket.timeCut",selectMovieTimeVO);
	}





}
