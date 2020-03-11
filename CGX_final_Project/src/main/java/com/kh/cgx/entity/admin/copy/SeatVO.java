package com.kh.cgx.entity.admin.copy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SeatVO {
	private int seat_no,seat_row,seat_col, reservationYn;
	private String seat_grade, chkSeatList;
	
}
