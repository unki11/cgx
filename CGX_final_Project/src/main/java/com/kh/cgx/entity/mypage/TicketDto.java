package com.kh.cgx.entity.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class TicketDto {
	
	private int ticket_no;
	private int member_no;
	private int movietime_no;
	private String ticket_buy_no;
	private int ticket_total_person;
	
}
