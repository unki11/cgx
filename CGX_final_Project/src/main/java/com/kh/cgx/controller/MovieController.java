package com.kh.cgx.controller;

import java.io.File;	
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
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

import org.springframework.web.servlet.ModelAndView;
import com.kh.cgx.entity.admin.AdminDto;
import com.kh.cgx.entity.movie.ActorDto;

import com.kh.cgx.entity.movie.MovieDto;

import com.kh.cgx.entity.movie.MovieVO2;

import com.kh.cgx.entity.movie.ReviewDto;

import com.kh.cgx.entity.user.MemberDto;
//import com.kh.cgx.repository.movie.DistDao;
//기열오빠 이거 오류나서 일단 주석처리햇어요

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.entity.movie.MovieVO2;
import com.kh.cgx.entity.movie.ReviewDto;
import com.kh.cgx.repository.movie.MovieDao;
import com.kh.cgx.repository.movie.MovieProfileDao;
import com.kh.cgx.repository.movie.PhysicalFileDao;
import com.kh.cgx.repository.movie.VideoDao;
import com.kh.cgx.vo.movie.AgeVO;
import com.kh.cgx.vo.movie.MovieActorVO;
import com.kh.cgx.vo.movie.StillcutVO;
import com.kh.cgx.vo.movie.VideoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/movie")
@Slf4j
public class MovieController {
	
	@Autowired
	private AgeVO ageVO;
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private VideoDao videoDao;

	@Autowired
	private MovieProfileDao movieProfileDao;

	@Autowired
	private PhysicalFileDao physicalFileDao;

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
	@ResponseBody //
	@GetMapping("/likeupdate")//주소 변경
	public Object movielog (HttpSession session, @RequestParam int movie_no,Model model) {
//		 int member_no = 1;
		log.info("movie_no={}",movie_no);
		Map<String, Object> data = new HashMap<String, Object>();

		 //String code = "false";
		 //로그인 다되면 session으로 처리
		 System.out.println("왔다감: "+movie_no); 
		 String id = (String)session.getAttribute("id");
		// System.out.println("세션"+id);
		 MemberDto memberDto = sqlSession.selectOne("member.login",id);
		 Map<String, Object> param = new HashMap<String, Object>();
		 param.put("member_no", memberDto.getMember_no());
		 param.put("movie_no", movie_no);
		 int member_no = memberDto.getMember_no();
		 int check = sqlSession.selectOne("movies.check",param);
		 System.out.println(param);
		 if(check>0) {
			 System.out.println("삭제");
			 sqlSession.delete("movies.deletewish",param);
			// movieDao.delete(member_no,movie_no);
     		 sqlSession.update("movies.updatewishreset", movie_no);
			 data.put("code", "false");
		 }else {
			 System.out.println("등록");
			 movieDao.insert(member_no,movie_no);
		
			sqlSession.update("movies.mvwishupdate",movie_no);
			// code = "true";
			 data.put("code", "true");
		 }
		
		 return data;
	}
	
	@GetMapping("/movielog")
	public String movielog(Model model, @RequestParam int member_no) {
		model.addAttribute("likemovie", movieDao.getList6(member_no));
		//log.info("like = {}", movieDao.getList6(member_no));
		
		return "mypage/movielog";
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



	// 기본 리스트와 검색 기능을 합친 메소드
	@GetMapping("/finder-test")
	public ModelAndView finder(@ModelAttribute MovieVO2 movieVO) {
//		log.info("genre={}",movieVO);
		List<MovieDto> finder_list = movieDao.finder(movieVO);
		// 검색결과수
//		int count = movieDao.count(movieVO.getType(), movieVO.getKeyword());

		ModelAndView mv = new ModelAndView();
		mv.addObject("finder_list", finder_list);
//		mv.addObject("count", count);
		mv.addObject("type", movieVO.getType());
		mv.addObject("keyword", movieVO.getKeyword());

		// 데이터를 맵에 저장
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("finder_list", finder_list);// 리스트
//		param.put("count", count);// 검색 결과 수
		param.put("type", movieVO.getType());// 검색 타입
		param.put("keyword", movieVO.getKeyword());// 검색 키워드
		mv.addObject("param", param);// 맵에 저장된 데이터를 mv 에 저장
		mv.setViewName("movie/finder_test");// 뷰를 jsp로 설정

		return mv;
	}

	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int files_no) throws IOException{
//		ResponseEntity : 스프링에서 응답해줄 데이터가 담긴 상자
//		ByteArrayResource : 스프링에서 관리할 수 있는 Byte 형식의 데이터셋
		File directory = new File("D:/upload/kh2a");	
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
			@ModelAttribute StillcutVO stillcutVO, Object files_no,
			Object age , Object cnt
			) {
		
//		해당 영화 스틸컷 파일 넘버,무비 넘버 불러 오기
		Map<String, Object> stillMap = new HashMap<String, Object>();
		stillMap.put("files_no", files_no);
		stillcutVO.setMovie_no(movie_no);
		
//		해당 영화 트레일러 영상 불러오기
		videoVO.setMovie_no(movie_no); 
		MovieDto movieDto = sqlSession.selectOne("movies.movieDetail",movie_no);
//		해당영화 배우 리스트 불러오기
		List<String> actorList = movieDao.getList4(movie_no);
//		해당 영화 남여 예매 분포도 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_no", movie_no);
		map.put("member_sex","남");

		int man = sqlSession.selectOne("movies.humanCount",map);
		map.remove("member_sex");
		map.put("member_sex", "여");
		int woman = sqlSession.selectOne("movies.humanCount",map);
//		연령별 예매 분포
		List<AgeVO> ageList = movieDao.getAgeList(movie_no);
		
		int total = 0;
		for(AgeVO vo : ageList) {
			if(vo.getAge() < 50) {
				model.addAttribute("age"+vo.getAge(), vo.getCnt());
			}
			else {
				total += vo.getCnt();
			}
		}
		model.addAttribute("age50", total);
		//데이터가 age0, age10, age20, age30, age40, age50 으로 6개 저장됨(없을 수도 있음)
		
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
		
//		스틸컷
		List<StillcutVO> info_stillcut = movieDao.getStillcut(stillcutVO);
		model.addAttribute("files_no", files_no);
		model.addAttribute("info_stillcut", info_stillcut);
//		트레일러
		List<VideoVO> info_trailer = videoDao.getListInfo(videoVO);
		modelMap.addAttribute("info_trailer", info_trailer);
//		남여 예매 분포
		model.addAttribute("movieActorVO", movieActorVO);
		model.addAttribute("man", man);
		model.addAttribute("woman",woman);


		
		
		
//		System.out.println("age = "+ age + "cnt = "+cnt);
//		log.info("age = "+ age + "cnt = "+cnt);
		
		
		
//		System.out.println( "model : "+movieActorVO);
//		System.out.println(movieActorVO);
		
		
		
		
//		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		
		List<ReviewDto> reviewlist = sqlSession.selectList("movies.review", movie_no);
		
		model.addAttribute("reviewlist",reviewlist);
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
