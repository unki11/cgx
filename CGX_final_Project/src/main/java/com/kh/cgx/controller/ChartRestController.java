package com.kh.cgx.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.service.movie.ChartService;

@Controller
@RequestMapping(value = "/restfull-service")
public class ChartRestController extends HttpServlet{

	private static final long serialVersionID = 1L;
	
	@Autowired
	private ChartService ChartService;
	
	@RequestMapping(value = "/letter-frequency-of-vowels-in-english.json", method = RequestMethod.GET)
	public @ResponseBody String getDataPoints(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return ChartService.getChartData();
	}
}
