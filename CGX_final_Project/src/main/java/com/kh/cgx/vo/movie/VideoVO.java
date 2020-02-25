package com.kh.cgx.vo.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class VideoVO {

	private String movie_title;
	private String video_link;
	private int movie_no;
	private String video_id;
	
}
