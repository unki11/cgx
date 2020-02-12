package com.kh.cgx.entity.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ActorDto {

	private int actor_no;
	private int movie_no;
	private String actor_name;
}
