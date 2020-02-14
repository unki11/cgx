package com.kh.cgx.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.entity.movie.MovieProfileDto;
import com.kh.cgx.entity.movie.ReviewDto;
import com.kh.cgx.repository.movie.MovieDao;
import com.kh.cgx.repository.movie.MovieProfileDao;
import com.kh.cgx.repository.movie.PhysicalFileDao;
import com.kh.cgx.repository.movie.VideoDao;
import com.kh.cgx.vo.movie.VideoVO;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/movie")
@Slf4j
public class MovieController {


	@Autowired
	private SqlSession sqlSession;
	
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
	
	//기본 리스트
	@GetMapping("/")
	public String movie(Model model) {
		List<MovieDto> list = movieDao.getList3();
		model.addAttribute("list", list);
		return "movie/movie";
	}
	
	
	//상영 예정작
	@GetMapping("/pre-movie")
	public String pre_movie(Model model){
		List<MovieDto> pre_list = movieDao.getList2();
		model.addAttribute("pre_list", pre_list);
		return "movie/pre_movie";
	}
	
	//무비 트레일러
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
	
	//기본 리스트와 검색 기능을 합친 메소드
	@GetMapping("/finder-test")
	public ModelAndView finder(@RequestParam(defaultValue ="movie_title" ) String type,
									@RequestParam(defaultValue="") Object keyword) {
		List<MovieDto> finder_list = movieDao.finder(type,keyword);
		//검색결과수
		int count = movieDao.count(type, keyword);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("finder_list", finder_list);
		mv.addObject("count", count);
		mv.addObject("type", type);
		mv.addObject("keyword", keyword);
		
		
		//데이터를 맵에 저장
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("finder_list", finder_list);// 리스트
		param.put("count", count);//검색 결과 수
		param.put("type", type);//검색 타입
		param.put("keyword", keyword);//검색 키워드
		mv.addObject("param", param);//맵에 저장된 데이터를 mv 에 저장
		mv.setViewName("movie/finder_test");//뷰를 jsp로 설정
		
		return mv;
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
	////////////////////////////////////////////////////////////////////////////
//	리뷰
	////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/review")
	private String reivewinsert() {
		
		return "movie/review";
	}
	
	@PostMapping("/review")
	private String reviewinsert2(@ModelAttribute ReviewDto reviewDto) {
		log.info("reviewDto={}",reviewDto);
		sqlSession.insert("review.insert", reviewDto);
		
		return "movie/review";
	}
	
}
