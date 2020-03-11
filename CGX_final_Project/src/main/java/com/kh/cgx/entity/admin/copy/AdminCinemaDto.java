package com.kh.cgx.entity.admin.copy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminCinemaDto {
	private int cinema_no, files_no;
	private String cinema_area, cinema_phone, cinema_addr;
}
