package com.kh.cgx.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.admin.AdminCinemaDto;
import com.kh.cgx.entity.admin.AdminDto;
import com.kh.cgx.entity.admin.AdminScreenDto;
import com.kh.cgx.entity.admin.ManagerDto;
import com.kh.cgx.entity.admin.ManagerReadyDto;
import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.ScreenDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.admin.AdminCinemaDao;
import com.kh.cgx.repository.admin.AdminDao;
import com.kh.cgx.repository.admin.AdminMovieDao;
import com.kh.cgx.repository.admin.AdminScreenDao;
import com.kh.cgx.repository.admin.ManagerDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	@Autowired
	private AdminCinemaDao cinemaDao;
	
	@Autowired
	private AdminMovieDao movieDao;
	
	@Autowired
	private AdminScreenDao screenDao;
	
	@Autowired
	private ManagerDao managerDao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	
	@GetMapping("/adminlist")
	public ModelAndView test(ModelAndView mav) {
		List<AdminDto> list = adminDao.getList();
		mav.addObject("list", list);
		mav.setViewName("admin/adminlist");
		return mav; 
	}
	
	@GetMapping("/admininsert")
	public String test2() {
		return "admin/admininsert";
	}
	
	@PostMapping("/admininsert")
	public String test2(@ModelAttribute AdminDto adminDto) {
		adminDto.setAdmin_pw(encoder.encode(adminDto.getAdmin_pw()));
		adminDao.insert(adminDto);
		return "redirect:/admin/adminlogin";
	}
	
	@PostMapping("/adminupdate")
	public String adminUpdate(@ModelAttribute AdminDto adminDto) {
		log.info("a={}",adminDto);
		adminDao.update(adminDto);
		return "redirect:/admin/adminlist";
	}
	
	@GetMapping("/admindelete")
	@ResponseBody
	public void admindelete(@RequestParam int no) {
		log.info("no = {}" , no);
		adminDao.delete(no);
	}
	
	@GetMapping("/adminlogin")
	public String adminLogin() {
		return "admin/adminlogin";
	}
	
	@PostMapping("/adminlogin")
	public String adminLogin2(HttpSession session, @ModelAttribute AdminDto adminDto) {
		/*
		 * AdminDto result = adminDao.login(adminDto); if(result == null) { return
		 * "/admin/adminLogin"; }
		 * 
		 * else { session.setAttribute("id", result.getAdmin_id()); return
		 * "redirect:/admin/Manager/managerInsert"; }
		 */
		log.info("admin_id={}",adminDto.getAdmin_id());
		AdminDto find = adminDao.login(adminDto);
		if(find == null) {
			return "/admin/adminlogin";
		}
		else {
			boolean correct = encoder.matches(adminDto.getAdmin_pw(),find.getAdmin_pw());
				if(correct == true) {
					log.info("admin_no={}",adminDto.getAdmin_no());
					session.setAttribute("admin_id", find.getAdmin_id());
					session.setAttribute("admin_no", find.getAdmin_no());
					if("master".equals(adminDto.getAdmin_id())) {
						return "redirect:/admin/adminlist";
					}else {
						return "redirect:/admin/manager/managerinsert";
					}
				}
				else {
					return "/admin/adminlogin";
				}
			}
		}
	
	@GetMapping("/adminlogout")
	public String adminLogout(HttpSession session) {
		session.removeAttribute("admin_id");
		session.removeAttribute("admin_no");
		return "/admin/adminlogin";
	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//		시네마
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@GetMapping("/cinema/adminlist")
	public ModelAndView test4(ModelAndView mav) {
		List<AdminCinemaDto> list = cinemaDao.getList();
		mav.addObject("list", list);
		mav.setViewName("admin/cinema/adminlist");
		return mav;
	}
	
	@GetMapping("/cinema/admininsert")
	public String test6() {
		return "admin/cinema/admininsert";
	}
	
	@PostMapping("/cinema/admininsert")
	public String test2(@ModelAttribute AdminCinemaDto cinemaDto,@RequestParam MultipartFile files) throws IllegalStateException, IOException {
		int files_no = movieDao.file();
		
		File dir = new File("D:/upload/movie");
		dir.mkdirs();//디렉터리 생성

		File target = new File(dir, String.valueOf(files_no));
		files.transferTo(target);
		cinemaDto.setFiles_no(files_no);
		cinemaDao.insert(cinemaDto);
		return "redirect:/admin/cinema/admininsert";
	}
	
	@GetMapping("/cinema/admindelete")
	@ResponseBody
	public void cinemadelete(@RequestParam int no) {
		cinemaDao.delete(no);
	}
	
	//////////////////////////////////////////////
//	무비
	/////////////////////////////////////////////
	
	@GetMapping("/movie/adminlist")
	public ModelAndView test8(ModelAndView mav) {
		List<MovieDto> list = movieDao.getList();
		mav.addObject("list",list);
		mav.setViewName("admin/movie/adminlist");
		return mav;
	}
	
	@GetMapping("/movie/admininsert")
	public String test10() {
		return "/admin/movie/admininsert";
		
	}	
	
	@PostMapping("/movie/admininsert")
	public String test2(@ModelAttribute MovieDto movieDto,@RequestParam MultipartFile files) throws IllegalStateException, IOException {
		int files_no = movieDao.file();
		
		File dir = new File("D:/upload/movie");
		dir.mkdirs();//디렉터리 생성

		File target = new File(dir, String.valueOf(files_no));
		files.transferTo(target);
		
		movieDto.setFiles_no(files_no);
		log.info("movieDto={}",movieDto);
		movieDao.insert(movieDto);
		
		return "redirect:/admin/movie/admininsert";
	}
	
	@GetMapping("/movie/admindelete")
	@ResponseBody
	public void moviedelete(int no) { 
		log.info("no={}",no);
		movieDao.delete(no);
	}
	
	@PostMapping("/movie/adminupdate")
	public String movieupdate(@ModelAttribute MovieDto movieDto) {
		log.info("movieDto = {}",movieDto);
		movieDao.update(movieDto);
		return "redirect:/admin/movie/adminlist";
	}
	
	////////////////////////////////////////////
//	상영관
	////////////////////////////////////////////
	
	@GetMapping("/screen/adminlist")
	public ModelAndView test12(ModelAndView mav) {
		List<AdminScreenDto> list = screenDao.getList();
		mav.addObject("list", list);
		mav.setViewName("admin/screen/adminlist");
		return mav;
	}
	
	@GetMapping("/screen/admininsert")
	public String test22(Model model) {
		List<AdminScreenDto> screenDto = screenDao.getList();
		model.addAttribute("screenDto", screenDto);
		
		List<CinemaDto> cinemaDto = cinemaDao.getCinemaList();
		model.addAttribute("cinemaDto",cinemaDto);
		return "/admin/screen/admininsert";
	}
	
	@PostMapping("/screen/admininsert")
	public String test21(@ModelAttribute AdminScreenDto screenDto) {
		log.info("no={}",screenDto);
		screenDao.insert(screenDto);
		return "redirect:/admin/screen/admininsert";
	}
	
	@GetMapping("/screen/admindelete")
	@ResponseBody
	public void screendelete(@RequestParam int no) {
		screenDao.delete(no);
	}
	
	/////////////////////////////////////
//	매니저
	/////////////////////////////////////
	
	@GetMapping("/manager/managerinsert")
	public String manager() {
		return "/admin/manager/managerinsert";
	}
	
	@GetMapping("/manager/managerinsert/cinema")
	@ResponseBody
	public List<CinemaDto> cinema(@RequestParam int no) {
		return managerDao.getCinemaList(no);
	}
	
	@GetMapping("/manager/managerinsert/movie")
	@ResponseBody
	public List<MovieDto> movie(){
		return managerDao.getMovieList();
	}
	
	@GetMapping("/manager/managerinsert/screen")
	@ResponseBody
	public List<ScreenDto> screen(@RequestParam int no){
		return managerDao.getScreenList(no);
	}
	
	@PostMapping("/manager/managerinsert")
	public String managerInsert(@ModelAttribute ManagerDto managerDto, @RequestParam String movietime_hour, @RequestParam String movietime_min) {
		String date = managerDto.getMovietime_time();
		date += " ";
		date += movietime_hour;
		date += ":";
		date += movietime_min;
		managerDto.setMovietime_time(date);
		log.info("managerDto={}",managerDto);
		managerDao.insert(managerDto);
		

		return "redirect:/admin/manager/managerinsert";
	}
	
	@GetMapping("/Manager/managerReady")
	public String managerReady() {
		return "/admin/Manager/managerReady";
	}
	
	@PostMapping("/Manager/managerReady")
	public String managerReady2(@ModelAttribute ManagerReadyDto readyDto) {
		managerDao.insert(readyDto);
		return "/admin/Manager/managerInsert";
	}
	
//	@GetMapping("/Manager/managerList")
//	public ModelAndView managerList(ModelAndView mav) 
//		List<ManagerDto> managerlist = managerDao.
//	}
	
	/////////////////////////////////////
//	Notice
	/////////////////////////////////////
	@GetMapping("/Notice/noticeInsert")
	public String noticeInsert() {
		return "/admin/Notice/noticeInsert";
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
	
	
	
}
