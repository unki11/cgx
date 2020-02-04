package com.kh.cgx.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cgx.entity.cinema.CinemaDto;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/")
	public String cinema() {
		
//		CinemaDto dto = sqlSession.selectList("cinema.list");
//		CinemaDto dto = sqlSession.selectList("cinema.list");
		return "cinema/cinema";
	}
}
