package com.kh.cgx.vo.cinema;

import java.util.List;

import com.kh.cgx.entity.cinema.MovieTimeDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class MovieTimeScreenVO {

	private int movie_no;
	private int screen_no;
	private List<MovieTimeDto> list;
}
