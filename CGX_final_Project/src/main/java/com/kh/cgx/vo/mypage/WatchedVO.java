package com.kh.cgx.vo.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class WatchedVO {
	
	private int member_no, movie_no,files_no,movie_ticket_rate,movie_runtime,ticket_total_person;
	private String movie_title,movie_director,movie_startdate,
	movie_country,movie_grade,movie_status,movie_genre,
	movie_publisher,movie_content,movietime_time,screen_name;
	
	
	

}
