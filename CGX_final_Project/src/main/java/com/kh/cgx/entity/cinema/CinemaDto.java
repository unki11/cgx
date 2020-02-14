package com.kh.cgx.entity.cinema;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CinemaDto {

	private int cinema_no, files_no;
	private String cinema_area, cinema_phone , cinema_addr;
}
