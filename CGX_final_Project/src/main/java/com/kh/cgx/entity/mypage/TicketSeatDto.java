package com.kh.cgx.entity.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TicketSeatDto {

	int ticket_seat_no,ticket_no,seat_no;
}
