package com.kh.cgx.repository.movie;

import java.util.List;

import com.kh.cgx.entity.movie.ActorDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.vo.movie.MovieActorVO;


public interface MovieDao {

	List<MovieDto> finder(String type,Object keyword);

	int count(String type , Object keyword) ;
	
	List<MovieDto> getList2();
	
	List<MovieDto> getList3();

	List<String> getList4(int movie_no);

	

	

	
	
	
}
