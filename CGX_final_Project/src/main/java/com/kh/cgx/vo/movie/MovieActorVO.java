package com.kh.cgx.vo.movie;

import java.util.List;

import com.kh.cgx.entity.movie.ActorDto;
import com.kh.cgx.entity.movie.MovieDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MovieActorVO {

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
	private List<String> actorList;


}
