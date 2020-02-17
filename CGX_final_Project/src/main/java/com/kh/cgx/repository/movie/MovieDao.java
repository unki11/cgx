package com.kh.cgx.repository.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.cgx.entity.admin.AdminDto;
import com.kh.cgx.entity.movie.ActorDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.vo.movie.MovieActorVO;
import com.kh.cgx.vo.movie.MovieVO;


public interface MovieDao {

	List<MovieDto> finder(String type,Object keyword);

	int count(String type , Object keyword) ;
	
	List<MovieDto> getList2();
	
	List<MovieDto> getList3();

	List<String> getList4();
	
	List<MovieVO> getList5();

	void insert(int member_no, int movie_no);
	

	
	
	
}
