package com.kh.cgx.repository.movie;

import java.util.List;

import com.kh.cgx.entity.movie.MovieDto;


public interface MovieDao {

	List<MovieDto> finder(String type,Object keyword);

	int count(String type , Object keyword) ;
	
	List<MovieDto> getList2();
	
	List<MovieDto> getList3();

	
	
	
}
