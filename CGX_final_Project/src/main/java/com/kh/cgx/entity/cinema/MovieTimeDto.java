package com.kh.cgx.entity.cinema;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MovieTimeDto {
	
	private int movietime_no, screen_no, movie_no;
	private String movietime_time, movietime_price;
}
