package com.kh.cgx.entity.cinema;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SeatDto {

	private int seat_no;
	private int	screen_no;
	private int seat_row;
	private int seat_col;
	private int seat_grade;
}
