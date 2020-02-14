package com.kh.cgx.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.service.movie.CanvasjsChartService;
 

 
 
@Controller
@RequestMapping(value = "/restfull-service")
public class RestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CanvasjsChartService canvasjsChartService;
	
	@RequestMapping(value = "/letter-frequency-of-vowels-in-english.json", method = RequestMethod.GET)
	public @ResponseBody String getDataPoints(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return canvasjsChartService.getCanvasjsChartData();
	}
}
