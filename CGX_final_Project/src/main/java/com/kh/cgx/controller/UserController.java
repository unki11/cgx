package com.kh.cgx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/login")
	public String login() {
		
		return "user/login";
	}
	
	@GetMapping("/join")
	public String join() {
		
		return "user/join";
	}
	
	@GetMapping("/search")
	public String search() {
		
		return "user/search";
	}
	
	@GetMapping("/find_pw")
	public String find_pw() {
		
		return "user/find_pw";
	}
	
	
	@GetMapping("/find_id")
	public String find_id() {
		
		return "user/find_id";
	}
	
	
	@GetMapping("/pw")
	public String pw() {
		
		return "user/pw_reconfirm";
	}
	
	
	@GetMapping("/three_month_pw")
	public String three_month_pw() {
		
		return "user/three_month_pw";
	}

}
