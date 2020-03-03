package com.kh.cgx.vo.movie;

import java.util.List;

import com.kh.cgx.vo.movie.MovieActorVO.MovieActorVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TicketVO {

	private int screen_no, cinema_no, screen_all_seat
	,screen_rowsize, screen_colsize;
	private String screen_type,screen_name;
	private int movietime_no,  movie_no;
	private String movietime_time, movietime_price;
	private String movie_hour;
}
