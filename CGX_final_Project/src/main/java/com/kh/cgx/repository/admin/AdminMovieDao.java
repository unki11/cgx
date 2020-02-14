package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.movie.MovieDto;		


public interface AdminMovieDao {
	void insert(MovieDto movieDto);
	List<MovieDto> getList();
	void delete(int no);
	void update(MovieDto movieDto);
}
