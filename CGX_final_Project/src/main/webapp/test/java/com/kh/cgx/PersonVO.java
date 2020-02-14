package com.kh.cgx;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PersonVO {
	private int no;
	private String name;
	private List<ScoreDto> list;
}
