package com.kh.cgx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

	@GetMapping("/")
	public String cinema() {
		
		return "cinema/cinema";
	}
}
