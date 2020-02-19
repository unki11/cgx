package com.kh.cgx.vo.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StillcutVO {

	private int stillcut_no;
	private int movie_no;
	private int files_no;
	
}
