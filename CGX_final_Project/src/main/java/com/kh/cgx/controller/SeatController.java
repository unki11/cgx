package com.kh.cgx.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.entity.admin.SeatVO;
import com.kh.cgx.repository.admin.SeatDao;

/**
 * Handles requests for the application seat page.
 */
@Controller
public class SeatController {
	
	private static final Logger logger = LoggerFactory.getLogger(SeatController.class);
	
	/**
	 * Simply selects the seat view to render by returning its name.
	 */
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private SeatVO seatDto;
	
	@RequestMapping(value = "/seatInfo", method = RequestMethod.GET)
	public String seatInfo(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//현재 상영관 정보 가져와야함.
		
		List<SeatVO> seatList = seatDao.getList();
//		System.out.println(seatList); 
		model.addAttribute("seatList", seatList );
		
		return "seat/seatInfo";
	}
	
	@GetMapping("/seatInsert")
	public String seatInsert() {
		return "seat/seatInsert";
	}
	
	//예매시 탈 로직 
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
		return List;
	}
	
	@GetMapping("/seat/seatInfo2")
	public String test() {
		return "/seat/seatInfo2";
	}
	
/*	@PostMapping("/seatInsert")
	@ResponseBody
	public List<List<String>> seatInsert1(@RequestParam List<String> seat) {	

		List<List<String>> List = new ArrayList<List<String>>();
		
		for(int i = 0; i<seat.size(); i++) {
			List<String> list = new ArrayList<>();
			String a = seat.get(i);
			String [] b = a.split("-");
			list.add(b[0]);
			list.add(b[1]);
			
			List.add(list);
		}
		return List;
	}
	*/
}
			 
			
	
		
		
		
