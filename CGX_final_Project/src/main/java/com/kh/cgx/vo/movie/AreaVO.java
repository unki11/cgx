package com.kh.cgx.vo.movie;

import java.util.List;

import com.kh.cgx.entity.cinema.CinemaDto;

import lombok.Data;

//지역별 영화관을 뽑기 위한 지역 클래스
@Data
public class AreaVO {
	private String name;
	private int movie_no;
	private List<CinemaDto> list;
}
