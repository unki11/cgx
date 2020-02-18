package com.kh.cgx.vo.cinema;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  @NoArgsConstructor @AllArgsConstructor @Builder

public class MovieTimeMovieVO {

	private int movie_no,movie_runtime;
	private String movie_title,movie_startdate,movie_grade,movie_genre,movie_status;
	private List<MovieTimeScreenVO> list;
}
