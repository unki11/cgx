package com.kh.cgx.vo.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewVO {

	private int review_no, ticket_no, review_egg, review_1, review_2, review_3, review_4, review_5;
	private String review_content;
	private String member_id;
}
