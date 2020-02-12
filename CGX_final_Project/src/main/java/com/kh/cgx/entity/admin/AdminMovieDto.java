package com.kh.cgx.entity.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminMovieDto {
	private int movie_no,files_no,movie_ticket_rate,movie_runtime;
	private String movie_title,movie_director,movie_startdate,movie_country,
							  movie_grade,movie_status,movie_publisher,movie_genre;
											
}