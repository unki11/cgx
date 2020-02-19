package com.kh.cgx.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.kh.cgx.entity.admin.AdminDto;
import com.kh.cgx.entity.movie.ActorDto;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.entity.movie.ReviewDto;

import com.kh.cgx.repository.movie.MovieDao;
import com.kh.cgx.repository.movie.MovieProfileDao;
import com.kh.cgx.repository.movie.PhysicalFileDao;
import com.kh.cgx.repository.movie.VideoDao;

import com.kh.cgx.vo.movie.MovieActorVO;
import com.kh.cgx.vo.movie.StillcutVO;
import com.kh.cgx.vo.movie.VideoVO;

import lombok.extern.slf4j.Slf4j;

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

	// 기본 리스트
	@GetMapping("/")
	public String movie(Model model) {
		List<MovieDto> list = movieDao.getList3();
		model.addAttribute("list", list);
		return "movie/movie";
	}
	
	// 위시리스트 (지현이 추가)
	@ResponseBody
	@GetMapping("/movieWish")
	public JSONObject movieWish (HttpSession session, @RequestParam int movieno) {
		
		 JSONObject json = new JSONObject();
		 int member_no = 1;
		 String code = "false";
		 //로그인 다되면 session으로 처리
		/*
		 * MemberDto memberdto = (MemberDto)session.getAttribute("MemberDto");
		 *  int member_no = memberdto.getMember_no();
		 */
		 try {
			   movieDao.insert(member_no,movieno);
			   code = "true";
		 }catch(Exception e){
			 e.printStackTrace();
			 
		 }
		
		 json.put("code",code);
		 return json;
	}

	// 상영 예정작
	@GetMapping("/pre-movie")
	public String pre_movie(Model model) {
		List<MovieDto> pre_list = movieDao.getList2();
		model.addAttribute("pre_list", pre_list);
		return "movie/pre_movie";	
	}

	// 무비 트레일러
	@GetMapping("/trailer")
	public String trailer(@ModelAttribute VideoVO videoVO, ModelMap modelMap) {
//		System.out.println("vo값  = "+videoVO);
		List<VideoVO> video_list = videoDao.getList(videoVO);
		modelMap.addAttribute("video_list", video_list);

		return "movie/trailer";
	}

	//영화 상세 정보의 예매 분포도 구하는 부분
//	@GetMapping("/detail1")
//	public String distribution(@ModelAttribute DistVO distVO, ModelMap modelMap) {
//		List<DistVO> dist_list = distDao.getList(distVO);
//		modelMap.addAttribute("dist_list" , dist_list);
//		return"movie/detail1";
//	}

	// 기본 리스트와 검색 기능을 합친 메소드
	@GetMapping("/finder-test")
	public ModelAndView finder(@RequestParam(defaultValue = "movie_title") String type,
			@RequestParam(defaultValue = "") Object keyword) {
		List<MovieDto> finder_list = movieDao.finder(type, keyword);
		// 검색결과수
		int count = movieDao.count(type, keyword);

		ModelAndView mv = new ModelAndView();
		mv.addObject("finder_list", finder_list);
		mv.addObject("count", count);
		mv.addObject("type", type);
		mv.addObject("keyword", keyword);

		// 데이터를 맵에 저장
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("finder_list", finder_list);// 리스트
		param.put("count", count);// 검색 결과 수
		param.put("type", type);// 검색 타입
		param.put("keyword", keyword);// 검색 키워드
		mv.addObject("param", param);// 맵에 저장된 데이터를 mv 에 저장
		mv.setViewName("movie/finder_test");// 뷰를 jsp로 설정

		return mv;
	}

	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int files_no) throws IOException{
//		ResponseEntity : 스프링에서 응답해줄 데이터가 담긴 상자
//		ByteArrayResource : 스프링에서 관리할 수 있는 Byte 형식의 데이터셋
		File directory = new File("C:\\upload");
		File file = new File(directory, String.valueOf(files_no));
		byte[] data = FileUtils.readFileToByteArray(file);
//		실제파일을 불러온다 : physicalFileDao

//		헤더설정 및 전송은 스프링의 방식으로 진행
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
					//.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(data.length)
					.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
					.header(HttpHeaders.CONTENT_DISPOSITION, 
								makeDispositionString(String.valueOf(files_no)))
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


//	영화 상세 정보
	@GetMapping("/detail")
	private String getList4(Model model, @RequestParam int movie_no,
			@ModelAttribute VideoVO videoVO, ModelMap modelMap,
			@ModelAttribute StillcutVO stillcutVO, Object files_no 
			) {
		
		
		Map<String, Object> stillMap = new HashMap<String, Object>();
		stillMap.put("files_no", files_no);
		
		stillcutVO.setMovie_no(movie_no);
		videoVO.setMovie_no(movie_no); 
		MovieDto movieDto = sqlSession.selectOne("movies.movieDetail",movie_no);
		List<String> actorList = movieDao.getList4(movie_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_no", movie_no);
		map.put("member_sex","남");
		
		int man = sqlSession.selectOne("movies.humanCount",map);
		map.remove("member_sex");
		map.put("member_sex", "여");
		int woman = sqlSession.selectOne("movies.humanCount",map);
		MovieActorVO movieActorVO = MovieActorVO.builder()
																
																.actorList(actorList)
																.movie_no(movieDto.getMovie_no())
																.files_no(movieDto.getFiles_no())
																.movie_title(movieDto.getMovie_title())
																.movie_director(movieDto.getMovie_director())
																.movie_ticket_rate(movieDto.getMovie_ticket_rate())
																.movie_startdate(movieDto.getMovie_startdate())
																.movie_runtime(movieDto.getMovie_runtime())
																.movie_country(movieDto.getMovie_country())
																.movie_grade(movieDto.getMovie_grade())
																.movie_status(movieDto.getMovie_status())
																.movie_publisher(movieDto.getMovie_publisher())
																.movie_genre(movieDto.getMovie_genre())
																.movie_content(movieDto.getMovie_content())
																
																.build();
		
		
		List<StillcutVO> info_stillcut = movieDao.getStillcut(stillcutVO);
		model.addAttribute("files_no", files_no);
		model.addAttribute("info_stillcut", info_stillcut);
		
		List<VideoVO> info_trailer = videoDao.getListInfo(videoVO);
		modelMap.addAttribute("info_trailer", info_trailer);
		
		model.addAttribute("movieActorVO", movieActorVO);
		model.addAttribute("man", man);
		model.addAttribute("woman",woman);
		
		
//		System.out.println( "model : "+movieActorVO);
//		System.out.println(movieActorVO);
		
		return "movie/detail";
	}

	
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
	
	
	//지현이가 추가한 페이지 
	@GetMapping("/searchview")
	public String searchView(Model model,@RequestParam() String keyword) {
		
		//String keyword = request.getParameter("keyword");
		keyword = 	keyword.replace(" ","");
	 	
		List<String> searchList = sqlSession.selectList("movies.movieSearch",keyword);
	 		
	 	model.addAttribute("searchList", searchList);
        	

	     return "movie/searchView";
	}
	
	
}
