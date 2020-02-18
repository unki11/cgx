package com.kh.cgx.entity.movie;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MovieVO {
	private String type = "movie_title";
	private String keyword = "";
	private List<String> genre, country, grade;
	
}
