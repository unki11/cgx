package com.kh.cgx.entity.movie;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MovieVO2 {
	private String type = "movie_title";
	private String keyword = "";
	private String actor_name;
	private List<String> genre, country, grade;
	
}
