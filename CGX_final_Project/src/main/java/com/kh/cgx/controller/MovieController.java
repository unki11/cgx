package com.kh.cgx.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.movie.FilesDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.movie.MovieDao;
import com.kh.cgx.repository.movie.PhysicalFileDao;

@Controller
@RequestMapping("/movie")
public class MovieController {

	@Autowired
	private PhysicalFileDao physicalFileDao;
	
	@Autowired
	private MovieDto movieDto;
	
	@Autowired
	private MovieDao movieDao;
	
	@GetMapping("/")
	public String movie(Model model) {
		List<MovieDto> list = movieDao.getList();
		model.addAttribute("list", list);
		return "movie/movie";
	}
	
	@GetMapping("/pre-movie")
	public String pre_movie(Model model){
		List<MovieDto> pre_list = movieDao.getList2();
		model.addAttribute("pre_list", pre_list);
		return "movie/pre_movie";
	}
	
	@GetMapping("/trailer")
	public String trailer() {
		
		return"movie/trailer";
	}
	
	@GetMapping("/finder")
	public String finder(Model model) {
		List<MovieDto> list = movieDao.getList();
		model.addAttribute("list", list);
		return "movie/finder";
	}
	
	@GetMapping("/")
	public ResponseEntity<ByteArrayResource> files(@RequestParam int files_no) {
		
		
		
		return null;
	}
	
	
}
