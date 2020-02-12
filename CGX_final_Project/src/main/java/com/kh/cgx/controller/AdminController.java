package com.kh.cgx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cgx.entity.admin.AdminCinemaDto;
import com.kh.cgx.entity.admin.AdminDto;
import com.kh.cgx.entity.admin.AdminMovieDto;
import com.kh.cgx.entity.admin.AdminScreenDto;
import com.kh.cgx.entity.admin.ManagerDto;
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
		List<AdminMovieDto> list = movieDao.getList();
		mav.addObject("list",list);
		mav.setViewName("admin/Movie/adminList");
		return mav;
	}
	
	@GetMapping("/Movie/adminInsert")
	public String test10() {
		return "/admin/Movie/adminInsert";
		
	}	
	
	@PostMapping("/Movie/adminInsert")
	public String test2(@ModelAttribute AdminMovieDto movieDto) {
		movieDao.insert(movieDto);
		return "redirect:/admin/Movie/adminInsert";
	}
	
	@GetMapping("/Movie/adminDelete")
	@ResponseBody
	public void moviedelete(int no) {
		movieDao.delete(no);
	}
	
	@PostMapping("/Movie/adminUpdate")
	public String movieupdate(@ModelAttribute AdminMovieDto movieDto) {
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
		mav.setViewName("Screen/adminList");
		return mav;
	}
	
	@GetMapping("/Screen/adminInsert")
	public String test22() {
		return "Screen/adminInsert";
	}
	
	@PostMapping("/Screen/adminInsert")
	public String test21(@ModelAttribute AdminScreenDto screenDto) {
		screenDao.insert(screenDto);
		return "redirect:/Screen/adminInsert";
	}
	
	@GetMapping("/Screen/adminDelete")
	@ResponseBody
	public void screendelete(@RequestParam int no) {
		screenDao.delete(no);
	}
	
	/////////////////////////////////////
//	매니저
	/////////////////////////////////////
	
	@GetMapping("/manager/managerInsert")
	public String managerInsert() {
		return "manager/managerInsert";
	}
	
	@PostMapping("/manager/managerInsert")
	public String managerInsert(@ModelAttribute ManagerDto managerDto) {
		managerDao.insert(managerDto);
		return null;
	}
	
}
