package com.kh.cgx.vo.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder

public class ReserveVO {
	
	private int ticket_no,files_no,seat_row,seat_col;
	private String movie_title,screen_name,movietime_time,seat_grade;
}
