package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.AdminCinemaDto;	


public interface AdminCinemaDao {
	List<AdminCinemaDto> getList();
	void insert(AdminCinemaDto cinemaDto);
	/* void update(AdminCinemaDto cinemaDto); */
	void delete(int no);
}
