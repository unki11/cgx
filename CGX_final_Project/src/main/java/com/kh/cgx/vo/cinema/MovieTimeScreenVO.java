package com.kh.cgx.vo.cinema;

import java.util.List;

import com.kh.cgx.entity.cinema.MovieTimeDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class MovieTimeScreenVO {

	private int screen_no,screen_all_seat;
	private String screen_type,screen_name;
	private List<MovieTimeSeatVO> list;
}
