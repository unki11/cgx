package com.kh.cgx.vo.movie;

import java.util.List;

import com.kh.cgx.entity.cinema.MovieTimeDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//예매 첫부분의 상영 시간표 구하기
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SelectMovieTimeVO {

	private String movie_hour;
	private int screen_all_seat;
	private String screen_name;
	private String screen_type;
	private int screen_no;
	private int movie_no;
	private String cinema_area;
	
}
