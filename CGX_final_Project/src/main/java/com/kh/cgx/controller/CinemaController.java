package com.kh.cgx.controller;

import java.io.File;	
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.cinema.ScreenDto;
import com.kh.cgx.entity.cinema.SeatDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.cinema.CinemaFileDao;
import com.kh.cgx.vo.cinema.MovieTimeMovieVO;
import com.kh.cgx.vo.cinema.MovieTimeScreenVO;
import com.kh.cgx.vo.cinema.MovieTimeSeatVO;

import lombok.extern.slf4j.Slf4j;

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
	
	@GetMapping("/seat")
	public String seat(Model model) {
		
		List<List<Integer>> seatreserved = new ArrayList<>();	
		List<Integer> a = new ArrayList<Integer>();
		List<Integer> b = new ArrayList<Integer>();
		a.add(1);
		a.add(2);
		b.add(2);
		b.add(2);
		seatreserved.add(a);
		seatreserved.add(b);
		System.out.println("seatset"+seatreserved);
		List<SeatDto> List = sqlSession.selectList("seat.search");
		log.info("list={}",List);
		List<List<Integer>> seatall = new ArrayList<>();
		ScreenDto screenDto = sqlSession.selectOne("seat.size");
		System.out.println("screenDto"+screenDto);
		for(SeatDto list : List) {
			List<Integer> seat = new ArrayList<Integer>();
			seat.add(list.getSeat_row());
			seat.add(list.getSeat_col());
			for(List<Integer> lis : seatreserved) {
				if(list.getSeat_row()==lis.get(0)&&list.getSeat_col()==lis.get(1)) {
					seat.add(0);
					break;
				}
			}
			seat.add(1);
			seatall.add(seat);
			log.info("seat={}",seat);
		}

		
		model.addAttribute("seatset", seatreserved);
		model.addAttribute("seatall", seatall);	
		model.addAttribute("rowsize", screenDto.getScreen_rowsize());
		model.addAttribute("colsize", screenDto.getScreen_colsize());
		log.info("seatall={}",seatall);
		return "cinema/seat";
	}
	
	@PostMapping("/seatInsert")
	@ResponseBody
	public List<List<String>> seatInsert(@RequestParam List<String> seat) {	
		List<List<String>> List = new ArrayList<List<String>>();
		
		for(int i = 0; i<seat.size(); i++) {
			List<String> list = new ArrayList<>();
			String a = seat.get(i);
			String [] b = a.split("-");
			list.add(b[0]);
			list.add(b[1]);
			
			List.add(list);
		}
		System.out.println(List);
		return List;
	}
	
	@GetMapping("/")
	public String cinema2(@RequestParam(required = false, defaultValue ="1") int cinema_no,Model model) throws ParseException {
			
		cinemaDto.builder().cinema_no(cinema_no).build();
		
//		List<CinemaDto> cinema_list = sqlSession.selectList("cinema.list");
		List<CinemaDto> cinema_list1 = sqlSession.selectList("cinema.search","서울%");
//		log.info("cinema_list={}",cinema_list2);
		model.addAttribute("cinema_list1", cinema_list1);
		
		List<CinemaDto> cinema_list2 = sqlSession.selectList("cinema.search","경기%");
//		log.info("cinema_list={}",cinema_list2);
		model.addAttribute("cinema_list2", cinema_list2);
		
		List<ScreenDto> screen_list = sqlSession.selectList("screen.search",cinema_no);

		model.addAttribute("screen_list", screen_list);
		
		List<MovieTimeDto> movieTime_list = sqlSession.selectList("movietime.search",cinema_no);
		model.addAttribute("movietime_list", movieTime_list);
		model.addAttribute("cinema_no",cinema_no);
//		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//		아래는 상영날짜 출력입니다
//		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		String [] calender = {"일","월","화","수","목","금","토"};
		
		List<String> datelist = sqlSession.selectList("movietime.date",cinema_no);
		List<List<String>> timelist = new ArrayList<>();
		
		

		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");

		String inputDate = dateFormat.format(System.currentTimeMillis());
		Date data = dateFormat.parse(inputDate);

		Calendar calendar = Calendar.getInstance();

		calendar.setTime(data);

		for(String time : datelist) {
			inputDate = time;
			
			data = dateFormat.parse(inputDate);
			
			calendar = Calendar.getInstance();
			
			calendar.setTime(data);
			
			List<String> data1 = new ArrayList<String>();
			String[] date = time.split("/");
			data1.add(date[0]);
			data1.add(date[1]);
			data1.add(date[2]);
			data1.add(calender[calendar.get(Calendar.DAY_OF_WEEK)-1]);
			timelist.add(data1);
			
		}
		model.addAttribute("timelist", timelist);
//		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//		아래는 상영시간표 출력입니다/
//		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		DateFormat dateFormat2 = new SimpleDateFormat("yyMMdd");

		String inputDate2 = dateFormat2.format(System.currentTimeMillis());
		
		List<MovieDto> movie = sqlSession.selectList("movietime.movie",cinema_no);
		List<ScreenDto> screen = sqlSession.selectList("movietime.screen",cinema_no);
		List<MovieTimeScreenVO> MTSlist = new ArrayList<>();
		List<MovieTimeMovieVO> MTMlist = new ArrayList<MovieTimeMovieVO>();
		for(MovieDto M : movie) {
			MovieTimeMovieVO movieTimeMovieVO = new MovieTimeMovieVO();

			MTSlist = new ArrayList<>();
			for(ScreenDto S : screen) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("movie_no",M.getMovie_no()); 
				map.put("screen_no",S.getScreen_no());
				map.put("cinema_no",cinema_no);
				map.put("movietime_time_start", inputDate2+"0000");
				map.put("movietime_time_end", inputDate2+"2359");
				List<MovieTimeSeatVO> mtlist = sqlSession.selectList("movietime.screenlist",map);
				if(mtlist.isEmpty()) {
					continue;
				}
				MovieTimeScreenVO movieTimeScreenVO = new MovieTimeScreenVO();
				movieTimeScreenVO.setScreen_no(S.getScreen_no());
				movieTimeScreenVO.setScreen_all_seat(S.getScreen_all_seat());;
				movieTimeScreenVO.setScreen_type(S.getScreen_type());;
				movieTimeScreenVO.setScreen_name(S.getScreen_name());
				movieTimeScreenVO.setList(mtlist);
				MTSlist.add(movieTimeScreenVO);
			}
			movieTimeMovieVO.setMovie_no(M.getMovie_no());
			movieTimeMovieVO.setMovie_title(M.getMovie_title());
			movieTimeMovieVO.setMovie_grade(M.getMovie_grade());
			movieTimeMovieVO.setMovie_runtime(M.getMovie_runtime());
			movieTimeMovieVO.setMovie_genre(M.getMovie_genre());
			movieTimeMovieVO.setMovie_startdate(M.getMovie_startdate());
			movieTimeMovieVO.setMovie_status(M.getMovie_status());
			movieTimeMovieVO.setList(MTSlist);
			MTMlist.add(movieTimeMovieVO);
		}
		model.addAttribute("list",MTMlist);
		/*
		 * List<MovieTimeDto> movieTime_list =
		 * sqlSession.selectList("movietime.search");
		 * model.addAttribute("movietime_list", movieTime_list);
		 */
		return "cinema/cinema";
	}
	
	@PostMapping("/movietimelist")
	@ResponseBody
	public List<MovieTimeMovieVO> ajax(int cinema_no,String movietime){
		log.info(movietime);
		List<MovieDto> movie = sqlSession.selectList("movietime.movie",cinema_no);
		List<ScreenDto> screen = sqlSession.selectList("movietime.screen",cinema_no);
		List<MovieTimeScreenVO> MTSlist = new ArrayList<>();
		List<MovieTimeMovieVO> MTMlist = new ArrayList<MovieTimeMovieVO>();
		System.out.println("movie size = " + movie.size());
		for(MovieDto M : movie) {
			MovieTimeMovieVO movieTimeMovieVO = new MovieTimeMovieVO();
			MTSlist = new ArrayList<>();
			for(ScreenDto S : screen) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("movie_no",M.getMovie_no()); 
				
				map.put("screen_no",S.getScreen_no());
				map.put("cinema_no",cinema_no);
				map.put("movietime_time_start", movietime+"0000");
				map.put("movietime_time_end",movietime+"2359");
				List<MovieTimeSeatVO> mtlist = sqlSession.selectList("movietime.screenlist",map);
				if(mtlist.isEmpty()) {
					System.out.println("없어요"+mtlist);
					continue;
				}
				MovieTimeScreenVO movieTimeScreenVO = new MovieTimeScreenVO();
				movieTimeScreenVO.setScreen_no(S.getScreen_no());	
				movieTimeScreenVO.setScreen_all_seat(S.getScreen_all_seat());;
				movieTimeScreenVO.setScreen_type(S.getScreen_type());;
				movieTimeScreenVO.setScreen_name(S.getScreen_name());
				movieTimeScreenVO.setList(mtlist);
				MTSlist.add(movieTimeScreenVO);	
			}
			if(MTSlist.isEmpty()) {
				continue;
			}
			movieTimeMovieVO.setMovie_no(M.getMovie_no());
			movieTimeMovieVO.setMovie_title(M.getMovie_title());
			movieTimeMovieVO.setMovie_grade(M.getMovie_grade());
			movieTimeMovieVO.setMovie_runtime(M.getMovie_runtime());
			movieTimeMovieVO.setMovie_genre(M.getMovie_genre());
			movieTimeMovieVO.setMovie_startdate(M.getMovie_startdate());
			movieTimeMovieVO.setMovie_status(M.getMovie_status());
			movieTimeMovieVO.setList(MTSlist);
			MTMlist.add(movieTimeMovieVO);
		}
		
		return MTMlist;		
	}
	
	@GetMapping("/time")
	public String test4(Model model) throws ParseException {
		
		String [] calender = {"일","월","화","수","목","금","토"};
		
		List<String> datelist = sqlSession.selectList("movietime.date");
		List<List<String>> timelist = new ArrayList<>();
		
		String inputDate = "20/02/17";

		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");

		Date data = dateFormat.parse(inputDate);

		Calendar calendar = Calendar.getInstance();

		calendar.setTime(data);
		log.info("calendar={}",calendar.get(Calendar.DAY_OF_WEEK));

		for(String time : datelist) {
			inputDate = time;
			
			data = dateFormat.parse(inputDate);
			
			calendar = Calendar.getInstance();
			
			calendar.setTime(data);
			
			List<String> data1 = new ArrayList<String>();
			String[] date = time.split("/");
			data1.add(date[0]);
			data1.add(date[1]);
			data1.add(date[2]);
			log.info("주말={}",calendar.get(Calendar.DAY_OF_WEEK));
			data1.add(calender[calendar.get(Calendar.DAY_OF_WEEK)-1]);
			timelist.add(data1);
			
		}
		log.info("datelist={}",datelist);
		log.info("timeList={}",timelist);
		for(List<String> tim : timelist) {
			log.info("time={}",tim);
		}
		model.addAttribute("timelist", timelist);
		return "cinema/time";
	}
	
	@PostMapping("/test")
	@ResponseBody
	public String test2(@RequestParam String id,Model model){
		log.info("dto는={}",id);
//		model.addAttribute("resp", "test");
//		model.addAttribute("id", id);
		
		return id;
	}
	@GetMapping("/upload")
	public String test3_1() {
		return "cinema/upload";
	}
	@PostMapping("/upload")
	public String test3(@RequestParam List<MultipartFile> files,Model model) throws IllegalStateException, IOException {
		
		log.info("리스트={}",files);
		File dir = new File("D:/upload/cinema");
		dir.mkdirs();//디렉터리 생성
		
		for(MultipartFile mf : files) {
			int no = sqlSession.selectOne("cinema.files");
			File target = new File(dir, String.valueOf(no));
			mf.transferTo(target);//파일 저장
			log.info("target={}",target);
			sqlSession.insert("cinema.filesinsert",no);
		}
		return "cinema/upload1";
	}
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int file_no) throws IOException{
//		ResponseEntity : 스프링에서 응답해줄 데이터가 담긴 상자
//		ByteArrayResource : 스프링에서 관리할 수 있는 Byte 형식의 데이터셋
		
		
//		실제파일을 불러온다 : physicalFileDao
		byte[] data = cinemaFileDao.get(file_no);
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
