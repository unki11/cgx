package com.kh.cgx.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.cinema.ScreenDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaController {

	
	@Autowired
	private CinemaDto cinemaDto;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/")
	public String cinema2(@RequestParam(required = false, defaultValue ="1") int cinema_no,Model model) {
			
		cinemaDto.builder().cinema_no(cinema_no).build();
		
		String area = "서울%";
//		List<CinemaDto> cinema_list = sqlSession.selectList("cinema.list");
		List<CinemaDto> cinema_list1 = sqlSession.selectList("cinema.search","서울%");
//		log.info("cinema_list={}",cinema_list2);
		model.addAttribute("cinema_list1", cinema_list1);
		
		List<CinemaDto> cinema_list2 = sqlSession.selectList("cinema.search","경기%");
//		log.info("cinema_list={}",cinema_list2);
		model.addAttribute("cinema_list2", cinema_list2);
		
		List<ScreenDto> screen_list = sqlSession.selectList("screen.search",cinema_no);
		log.info("asd={}",screen_list);
		log.info("list={}",screen_list);
		model.addAttribute("screen_list", screen_list);
		
		List<MovieTimeDto> movieTime_list = sqlSession.selectList("movietime.search",cinema_no);
		model.addAttribute("movietime_list", movieTime_list);
		
		
		/*
		 * List<MovieTimeDto> movieTime_list =
		 * sqlSession.selectList("movietime.search");
		 * model.addAttribute("movietime_list", movieTime_list);
		 */
		
		return "cinema/cinema";
	}
}
