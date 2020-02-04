package com.kh.cgx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@GetMapping("/mycgv")
	public String mycgv() {
		
		return "mypage/mycgv";
	}
	
	@GetMapping("/reserve")
	public String reserve() {
		
		return "mypage/reserve";
	}
	
	@GetMapping("/movielog")
	public String movielog() {
		
		return "mypage/movielog";
	}
	
	@GetMapping("/movielog/watched")
	public String watched() {
		
		return "mypage/watched";
	}
}
