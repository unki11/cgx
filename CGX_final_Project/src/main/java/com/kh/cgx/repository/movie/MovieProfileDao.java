package com.kh.cgx.repository.movie;

import com.kh.cgx.entity.movie.MovieProfileDto;

public interface MovieProfileDao {

	int getSequence();
	void regist();
	MovieProfileDto get(int files_no);
}
