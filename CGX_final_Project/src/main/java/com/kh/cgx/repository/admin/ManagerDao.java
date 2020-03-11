package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.ManagerDto;
import com.kh.cgx.entity.admin.ManagerReadyDto;
import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.ScreenDto;
import com.kh.cgx.entity.movie.ActorDto;
import com.kh.cgx.entity.movie.MovieDto;

public interface ManagerDao {
	void insert(ManagerDto managerDto);
	List<MovieDto> getMovieList();
	List<ScreenDto> getScreenList(int no);
	List<ManagerDto> getList();
	List<CinemaDto> getCinemaList(int no);
	void insert(ManagerReadyDto readyDto);
	void actorinsert(ActorDto actotDto);
	List<MovieDto> getMovie();
}
