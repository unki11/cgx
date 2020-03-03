package com.kh.cgx.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.cinema.ScreenDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.movie.MainTicketDao;
import com.kh.cgx.repository.movie.MovieDao;
import com.kh.cgx.repository.movie.MovieProfileDao;
import com.kh.cgx.repository.movie.PhysicalFileDao;
import com.kh.cgx.repository.movie.VideoDao;
import com.kh.cgx.vo.movie.AgeVO;
import com.kh.cgx.vo.movie.AreaVO;
import com.kh.cgx.vo.movie.MovieActorVO;
import com.kh.cgx.vo.movie.SelectMovieTimeVO;
import com.kh.cgx.vo.movie.StillcutVO;
import com.kh.cgx.vo.movie.VideoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ticket")
@Slf4j
public class TicketController {

	@Autowired
	private SelectMovieTimeVO selectMovieTimeVO;
	
	@Autowired
	private MovieTimeDto movieTimeDto;
	
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
	
	@Autowired
	private ScreenDto screenDto;
	
	@Autowired
	private MainTicketDao mainTicketDao;
	
	
	//예매 첫 구간
	@GetMapping("/")
	public String ticket(Model model){
//		현재 상영작 리스트
		List<MovieDto> titleList = mainTicketDao.movieTitle();
		model.addAttribute("titleList", titleList);
		return "ticket/ticket";
		}
		
	//예매 두번째 구간
	@GetMapping("/stepCinema")
	public String ticket2(Model model,int movie_no) {
		
//		극장 리스트
		movieTimeDto.setMovie_no(movie_no);
		List<AreaVO> areaList = mainTicketDao.getAreaAndCinemaList(movie_no);
		model.addAttribute("areaList", areaList);
		
		ModelAndView mv = new ModelAndView();
		
		
		return "ticket/cinema";
	}

		
		
		@GetMapping("/stepDateTime")
//	 	상영 시간표 리스트 전 날짜 선택
	public String ticket4(
			@RequestParam(value="date" ,required=false) String date,
			@RequestParam int cinema_no,
			@RequestParam int movie_no,
			Model model) {
 
//			selectMovieTimeVO.setCinema_area(cinema_area);
//			selectMovieTimeVO.setMovie_no(movie_no);
			
//			List<SelectMovieTimeVO> timeList =mainTicketDao.timeList(selectMovieTimeVO); 
//			ModelAndView mv = new ModelAndView();
//			mv.addObject("timeList", timeList);
//			mv.addObject("cinema_no", selectMovieTimeVO.getCinema_no());
//			mv.addObject("movie_no", selectMovieTimeVO.getMovie_no());
//			mv.addObject("date", selectMovieTimeVO.getDate());
			
			
			Map<String,Object> dateMap = new HashMap<String, Object>();
			dateMap.put("cinema_no",cinema_no);
			dateMap.put("movie_no",movie_no);
//			dateMap.put("timeList", timeList);
			dateMap.put("date", date);
			
			List<SelectMovieTimeVO> list = sqlSession.selectList("ticket.timeCut", dateMap);
			
			model.addAttribute("list", list);
//			mv.addObject("dateMap", dateMap);
//			mv.setViewName("ticket/dateTime");
			
		
		 return "ticket/dateTime";
		}
	
//	@GetMapping("stepTime")
//// 	상영 시간표 리스트
//public ModelAndView ticket3(@ModelAttribute SelectMovieTimeVO selectMovieTimeVO) {
//
////		selectMovieTimeVO.setCinema_area(cinema_area);
////		selectMovieTimeVO.setMovie_no(movie_no);
//		
//		List<SelectMovieTimeVO> timeList2 =mainTicketDao.timeList2(selectMovieTimeVO); 
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("timeList2", timeList2);
//		mv.addObject("cinema_area", selectMovieTimeVO.getCinema_area());
//		mv.addObject("movie_no", selectMovieTimeVO.getMovie_no());
//		mv.addObject("day", selectMovieTimeVO.getDay());
//		
//		Map<String,Object> dateMap = new HashMap<String, Object>();
//		dateMap.put("cinema_area",selectMovieTimeVO.getCinema_area());
//		dateMap.put("movie_no",selectMovieTimeVO.getMovie_no());
//		dateMap.put("timeList2", timeList2);
//		dateMap.put("day", selectMovieTimeVO.getDay());
//		mv.addObject("dateMap", dateMap);
//		mv.setViewName("ticket/dateTime");
//		
//	
//	 return mv;
//	}
	
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
		
		return "ticket/detail";
	}
	
	
	/**
	 * 상영시간표를 사용자에게 출력해주기 위한 처리
	 * 필요한 파라미터 : 
	 * 	- 상영일 : date
	 * - 상영지점번호 : cinema_no
	 * - 영화번호 : movie_no
	 * - sql 구문 : 
	 * 		select 
	 * 			movietime.* 		
	 *		from 
	 *				movietime + movie + screen + cinema
	 *		where 
	 *				movietime.movietime_start = ? 
	 *				and 
	 *				cinema.cinema_no=? 
	 *				and 
	 *				movie.movie_no=? 
	 *		order by 
	 *				movietime.movietime_start asc
	 */
	@GetMapping("/step_time")
	public String stepTime(
				//요청 파라미터
				@RequestParam(value="date" ,required=false) String date,
				@RequestParam int cinema_no,
				@RequestParam int movie_no,
				//전달을 위한 도구
				Model model
			) {
		
//		List<SelectMovieTimeVO> timeList =mainTicketDao.timeList(selectMovieTimeVO);
		
		Map<String, Object> param = new HashMap<>();
		param.put("cinema_no", cinema_no);
		param.put("movie_no", movie_no);
		param.put("date", date);
//		param.put("timeList", timeList);
		List<MovieTimeDto> list = sqlSession.selectList("ticket.getMovietimeListByCinemaAndMovieAndDate", param);
		
		model.addAttribute("list", list);
		
		return "ticket/time";
	}
}








