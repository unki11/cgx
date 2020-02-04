package com.kh.cgx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/culture")
public class CultureController {

	@GetMapping("/")
	public String event() {
		
		return "culture/event";
	}
	
	@GetMapping("/store")
	public String store() {
		
		return "culture/store";
	}
}
