package com.kh.cgx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.admin.AdminCinemaDto;
import com.kh.cgx.entity.admin.AdminDto;
import com.kh.cgx.entity.admin.AdminScreenDto;
import com.kh.cgx.entity.admin.ManagerDto;
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
	
	
	@GetMapping("/adminList")
	public ModelAndView test(ModelAndView mav) {
		List<AdminDto> list = adminDao.getList();
		mav.addObject("list", list);
		mav.setViewName("admin/adminList");
		return mav; 
	}
	
	@GetMapping("/adminInsert")
	public String test2() {
		return "admin/adminInsert";
	}
	
	@PostMapping("/adminInsert")
	public String test2(@ModelAttribute AdminDto adminDto) {
		adminDao.insert(adminDto);
		return "redirect:/admin/adminInsert";
	}
	
	@PostMapping("/adminUpdate")
	public String adminUpdate(@ModelAttribute AdminDto adminDto) {
		log.info("a={}",adminDto);
		adminDao.update(adminDto);
		return "redirect:/admin/adminList";
	}
	
	@GetMapping("/adminDelete")
	@ResponseBody
	public void admindelete(@RequestParam int no) {
		log.info("no = {}" , no);
		adminDao.delete(no);
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//		시네마
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@GetMapping("/Cinema/adminList")
	public ModelAndView test4(ModelAndView mav) {
		List<AdminCinemaDto> list = cinemaDao.getList();
		mav.addObject("list", list);
		mav.setViewName("admin/Cinema/adminList");
		return mav;
	}
	
	@GetMapping("/Cinema/adminInsert")
	public String test6() {
		return "/admin/Cinema/adminInsert";
	}
	
	@PostMapping("/Cinema/adminInsert")
	public String test2(@ModelAttribute AdminCinemaDto cinemaDto) {
		cinemaDao.insert(cinemaDto);
		return "redirect:/admin/Cinema/adminInsert";
	}
	
	@GetMapping("/Cinema/adminDelete")
	@ResponseBody
	public void cinemadelete(@RequestParam int no) {
		cinemaDao.delete(no);
	}
	
	//////////////////////////////////////////////
//	무비
	/////////////////////////////////////////////
	
	@GetMapping("/Movie/adminList")
	public ModelAndView test8(ModelAndView mav) {
		List<MovieDto> list = movieDao.getList();
		mav.addObject("list",list);
		mav.setViewName("admin/Movie/adminList");
		return mav;
	}
	
	@GetMapping("/Movie/adminInsert")
	public String test10() {
		return "/admin/Movie/adminInsert";
		
	}	
	
	@PostMapping("/Movie/adminInsert")
	public String test2(@ModelAttribute MovieDto movieDto) {
		movieDao.insert(movieDto);
		return "redirect:/admin/Movie/adminInsert";
	}
	
	@GetMapping("/Movie/adminDelete")
	@ResponseBody
	public void moviedelete(int no) {
		movieDao.delete(no);
	}
	
	@PostMapping("/Movie/adminUpdate")
	public String movieupdate(@ModelAttribute MovieDto movieDto) {
		log.info("movieDto = {}",movieDto);
		movieDao.update(movieDto);
		return "redirect:/admin/Movie/adminList";
	}
	
	////////////////////////////////////////////
//	상영관
	////////////////////////////////////////////
	
	@GetMapping("/Screen/adminList")
	public ModelAndView test12(ModelAndView mav) {
		List<AdminScreenDto> list = screenDao.getList();
		mav.addObject("list", list);
		mav.setViewName("admin/Screen/adminList");
		return mav;
	}
	
	@GetMapping("/Screen/adminInsert")
	public String test22(Model model) {
		List<AdminScreenDto> screenDto = screenDao.getList();
		model.addAttribute("screenDto", screenDto);
		
		List<CinemaDto> cinemaDto = cinemaDao.getCinemaList();
		model.addAttribute("cinemaDto",cinemaDto);
		return "/admin/Screen/adminInsert";
	}
	
	@PostMapping("/Screen/adminInsert")
	public String test21(@ModelAttribute AdminScreenDto screenDto) {
		screenDao.insert(screenDto);
		return "redirect:/admin/Screen/adminInsert";
	}
	
	@GetMapping("/Screen/adminDelete")
	@ResponseBody
	public void screendelete(@RequestParam int no) {
		screenDao.delete(no);
	}
	
	/////////////////////////////////////
//	매니저
	/////////////////////////////////////
	
	@GetMapping("/Manager/managerInsert")
	public String manager() {
		return "/admin/Manager/managerInsert";
	}
	
	@GetMapping("/Manager/managerInsert/cinema")
	@ResponseBody
	public List<CinemaDto> cinema(@RequestParam int no) {
		return managerDao.getCinemaList(no);
	}
	
	@GetMapping("/Manager/managerInsert/movie")
	@ResponseBody
	public List<MovieDto> movie(){
		return managerDao.getMovieList();
	}
	
	@GetMapping("/Manager/managerInsert/screen")
	@ResponseBody
	public List<ScreenDto> screen(@RequestParam int no){
		return managerDao.getScreenList(no);
	}
	
	@PostMapping("/Manager/managerInsert")
	public String managerInsert(@ModelAttribute ManagerDto managerDto) {
		log.info("managerDto={}",managerDto);
		managerDao.insert(managerDto);
		return "/Manager/managerInsert";
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
	
}
