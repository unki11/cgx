package com.kh.cgx.entity.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MovieDto {

	private int movie_no;
	private int files_no;
	private String movie_title;
	private String movie_director;
	private int movie_ticket_rate;
	private String movie_startdate;
	private int movie_runtime;
	private String movie_country;
	private String movie_grade;
	private String movie_status;
	private String movie_publisher;
	private String movie_genre;
	private String movie_content;
	private String movie_wish;
	private String actor_name;

	
}
