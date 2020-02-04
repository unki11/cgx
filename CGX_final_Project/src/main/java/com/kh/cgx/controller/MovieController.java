package com.kh.cgx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieController {

	@GetMapping("/")
	public String movie(Model model) {
		
		model.addAttribute("list", list);
		return "movie/movie";
	}
	
	@GetMapping("/pre-movie")
	public String pre_movie(){
		
		return "movie/pre_movie";
	}
	
	@GetMapping("/finder")
	public String finder() {
		
		return "movie/finder";
	}
}
