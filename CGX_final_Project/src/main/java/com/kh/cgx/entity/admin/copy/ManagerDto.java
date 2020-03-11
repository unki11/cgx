package com.kh.cgx.entity.admin.copy;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ManagerDto {
	private int movie_no,cinema_no,screen_no,movietime_price;
	private String movietime_time;

}
