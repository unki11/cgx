package com.kh.cgx.vo.cinema;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MovieTimeSeatVO {

	private int movietime_no,ticket_count;
	private String movietime_time;
}
