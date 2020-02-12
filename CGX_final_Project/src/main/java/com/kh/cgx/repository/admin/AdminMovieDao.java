package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.AdminMovieDto;		


public interface AdminMovieDao {
	void insert(AdminMovieDto movieDto);
	List<AdminMovieDto> getList();
	void delete(int no);
	void update(AdminMovieDto movieDto);
}
