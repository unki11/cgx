package com.kh.cgx.entity.cinema;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ScreenDto {

	private int screen_no, cinema_no, screen_all_seat
	,screen_rowsize, screen_colsize;
	private String screen_type,screen_name;
}
