package com.kh.cgx.entity.admin.copy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminScreenDto {
	private int screen_no,cinema_no,screen_all_seat,screen_rowsize,screen_colsize;
	private String screen_type,screen_name;
}
