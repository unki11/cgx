package com.kh.cgx.entity.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReviewDto {

	private int review_no, ticket_no, review_egg, review_1, review_2, review_3, review_4, review_5;
	private String review_content;
}
