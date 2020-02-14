package com.kh.cgx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/movie")
public class ChartController {

	@RequestMapping(method = RequestMethod.GET)
	public String infoChart (ModelMap modelMap) {
		
		return"movie/detail";
	}
	
}
