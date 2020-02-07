package com.kh.cgx.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.entity.movie.MovieProfileDto;
import com.kh.cgx.entity.movie.VideoDto;
import com.kh.cgx.repository.movie.MovieDao;
import com.kh.cgx.repository.movie.MovieProfileDao;
import com.kh.cgx.repository.movie.PhysicalFileDao;
import com.kh.cgx.repository.movie.VideoDao;

import com.kh.cgx.vo.movie.VideoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/movie")
@Slf4j
public class MovieController {


	
	@Autowired
	private VideoDao videoDao;
	
	@Autowired
	private MovieProfileDao movieProfileDao;
	
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
	public String trailer(@ModelAttribute VideoVO videoVO ,ModelMap model) {
//		System.out.println("vo값  = "+vo.getMovie_title() + vo.getVideo_link());
	List<VideoVO> video_list  = videoDao.getList(videoVO);
	model.addAttribute("video_list", video_list);
		
	return"movie/trailer";
	}
//	@GetMapping("/trailer")
//	public String trailer(Model model ) {
//		List<VideoDto> video_list = videoDao.getList();
//		model.addAttribute("video_list", video_list);
//		
//	return"movie/trailer";
//}
	
	@GetMapping("/finder")
	public String finder(Model model) {
		List<MovieDto> list = movieDao.getList();
		model.addAttribute("list", list);
		return "movie/finder";
	}
	
//	@GetMapping("/")
	public ResponseEntity<ByteArrayResource> files(@RequestParam int files_no) throws IOException {
		MovieProfileDto movieProfileDto = 
				movieProfileDao.get(files_no);
		
		byte[] data = physicalFileDao.get(movieProfileDto.getFiles_no());
		
		ByteArrayResource resource = new ByteArrayResource(data);
		
		
		
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(data.length)
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header(HttpHeaders.CONTENT_DISPOSITION,
						makeDispositionString(movieProfileDto.getFiles_no()))
				.body(resource);
	}
	
	private String makeDispositionString(int files_no) throws UnsupportedEncodingException {
		StringBuffer buffer = new StringBuffer();
		buffer.append("attachment;");
		buffer.append("filename=");
		buffer.append("\"");
		buffer.append(URLEncoder.encode(String.valueOf(files_no), "UTF-8"));
		buffer.append("\"");
		return buffer.toString();
	}
	
	
}
