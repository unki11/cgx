package com.kh.cgx.repository.movie;

import java.util.List;



import com.kh.cgx.entity.movie.MovieDto;

import com.kh.cgx.entity.movie.MovieVO;





public interface MovieDao {

	List<MovieDto> finder(MovieVO movieVO);

	int count(String type , Object keyword) ;
	
	List<MovieDto> getList2();
	
	List<MovieDto> getList3();


	List<String> getList4(int movie_no);


	
	List<MovieVO> getList5();

	void insert(int member_no, int movie_no);
	

	
	
	
}
