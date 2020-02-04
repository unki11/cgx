package com.kh.cgx.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.cinema.ScreenDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaController {

	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/")
	public String cinema(Model model) {
		
//		CinemaDto dto = sqlSession.selectList("cinema.list");
		List<CinemaDto> cinema_list = sqlSession.selectList("cinema.list");
		model.addAttribute("cinema_list", cinema_list);
		log.info("cinema={}",cinema_list.get(1));
		List<ScreenDto> screen_list = sqlSession.selectList("screen.list");
		log.info("list={}",screen_list);
		model.addAttribute("screen_list", screen_list);
		List<MovieTimeDto> movieTime_list = sqlSession.selectList("movietime.list");
		model.addAttribute("movietime_list", movieTime_list);
		
		return "cinema/cinema";
	}
}
