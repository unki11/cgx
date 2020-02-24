package com.kh.cgx.repository.movie;

import java.util.List;
import java.util.Map;

import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.vo.movie.AddrVO;
import com.kh.cgx.vo.movie.AreaVO;
import com.kh.cgx.vo.movie.SelectMovieTimeVO;

public interface MainTicketDao {

	List<MovieDto> movieTitle();

	List<AddrVO> addrList();
	
	List<AreaVO> getAreaAndCinemaList(int movie_no);

	List<SelectMovieTimeVO> timeList(SelectMovieTimeVO selectMovieTimeVO);

}
