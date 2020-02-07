package com.kh.cgx.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.cinema.ScreenDto;
import com.kh.cgx.repository.cinema.CinemaFileDao;
import com.kh.cgx.vo.cinema.MovieTimeMovieVO;
import com.kh.cgx.vo.cinema.MovieTimeScreenVO;

import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.s;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaController {

	
	@Autowired
	private CinemaDto cinemaDto;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CinemaFileDao cinemaFileDao;
	
	@GetMapping("/")
	public String cinema2(@RequestParam(required = false, defaultValue ="1") int cinema_no,Model model) {
			
		cinemaDto.builder().cinema_no(cinema_no).build();
		
//		List<CinemaDto> cinema_list = sqlSession.selectList("cinema.list");
		List<CinemaDto> cinema_list1 = sqlSession.selectList("cinema.search","서울%");
//		log.info("cinema_list={}",cinema_list2);
		model.addAttribute("cinema_list1", cinema_list1);
		
		log.info("cinema_file={}",cinema_list1);
		List<CinemaDto> cinema_list2 = sqlSession.selectList("cinema.search","경기%");
//		log.info("cinema_list={}",cinema_list2);
		model.addAttribute("cinema_list2", cinema_list2);
		
		List<ScreenDto> screen_list = sqlSession.selectList("screen.search",cinema_no);

		model.addAttribute("screen_list", screen_list);
		
		List<MovieTimeDto> movieTime_list = sqlSession.selectList("movietime.search",cinema_no);
		model.addAttribute("movietime_list", movieTime_list);
		
		
		/*
		 * List<MovieTimeDto> movieTime_list =
		 * sqlSession.selectList("movietime.search");
		 * model.addAttribute("movietime_list", movieTime_list);
		 */
		return "cinema/cinema";
	}
	@GetMapping("/test")
	public String test(Model model) {
		 
		List<Integer> movie = sqlSession.selectList("movietime.movie");
		log.info("무비={}",movie);
		List<Integer> screen = sqlSession.selectList("movietime.screen");
		log.info("스크린={}",screen);
		List<MovieTimeScreenVO> MTSlist = new ArrayList<>();
		List<MovieTimeMovieVO> MTMlist = new ArrayList<MovieTimeMovieVO>();
		for(int M : movie) {
			MovieTimeMovieVO movieTimeMovieVO = new MovieTimeMovieVO();

			MTSlist = new ArrayList<>();
			for(int S : screen) {
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("movie_no",M); 
				
				map.put("screen_no",S);
				System.out.println("M"+M);
				System.out.println("S"+S);

				System.out.println("map"+map);
				List<MovieTimeDto> mtlist = sqlSession.selectList("movietime.screenlist",map);
				if(mtlist.isEmpty()) {
					continue;
				}
				MovieTimeScreenVO movieTimeScreenVO = new MovieTimeScreenVO();
				System.out.println("mtlist : "+mtlist);
				movieTimeScreenVO.setMovie_no(M);
				movieTimeScreenVO.setScreen_no(S);
				movieTimeScreenVO.setList(mtlist);
				System.out.println("movieTimeScreenVo"+movieTimeScreenVO.getList());
				MTSlist.add(movieTimeScreenVO);
				System.out.println("MTSlist체크 : "+MTSlist);
			}
			movieTimeMovieVO.setMovie_no(M);
			movieTimeMovieVO.setList(MTSlist);
			MTMlist.add(movieTimeMovieVO);
		}
		for(MovieTimeScreenVO list : MTSlist) {
			System.out.println(list);
		}
		System.out.println(MTSlist);
		
		for(MovieTimeMovieVO list : MTMlist) {
			System.err.println(list);
		}
		System.out.println(MTMlist);
		model.addAttribute("list",MTMlist);
		
		return "cinema/cinema_test";
	}
	
	@PostMapping("/test")
	@ResponseBody
	public String test2(@RequestParam String id,Model model){
		log.info("dto는={}",id);
//		model.addAttribute("resp", "test");
//		model.addAttribute("id", id);
		
		return id;
	}
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int file_no) throws IOException{
//		ResponseEntity : 스프링에서 응답해줄 데이터가 담긴 상자
//		ByteArrayResource : 스프링에서 관리할 수 있는 Byte 형식의 데이터셋
		
		
//		실제파일을 불러온다 : physicalFileDao
		byte[] data = cinemaFileDao.get(file_no);
		log.info("data={}",data);
//		헤더설정 및 전송은 스프링의 방식으로 진행
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
					//.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(data.length)
					.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
					.header(HttpHeaders.CONTENT_DISPOSITION, 
								makeDispositionString(String.valueOf(file_no)))
					.body(resource);
	}
	
	private String makeDispositionString(String filename) throws UnsupportedEncodingException {
		StringBuffer buffer = new StringBuffer();
		buffer.append("attachment;");
		buffer.append("filename=");
		buffer.append("\"");
		buffer.append(URLEncoder.encode(filename, "UTF-8"));
		buffer.append("\"");
		return buffer.toString();
	}
}
