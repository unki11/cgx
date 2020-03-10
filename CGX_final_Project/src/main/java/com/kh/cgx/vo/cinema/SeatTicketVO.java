package com.kh.cgx.vo.cinema;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SeatTicketVO {

	int files_no;
	String cinema_area;
	String screen_name;
	String movie_title;
	String screen_type;
	String movie_grade;
	String movie_runtime;
	int movietime_price;
	String movietime_time;
	String end;
	int all_seat;
	int ticket_count;
}
