package com.kh.cgx.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cgx.entity.mypage.TicketDto;
import com.kh.cgx.entity.user.MemberDto;
import com.kh.cgx.repository.user.MemberDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MemberDao memberdao;
	
	@Autowired
	private MemberDto memberdto;
	
	@Autowired
	private SqlSession sqlSession;

	@GetMapping("/mycgv")
	public String mycgv(Model model) {
		int member_no=1;
		MemberDto search=sqlSession.selectOne("mypage.search",member_no);
//		System.out.println("list : "+list);
		model.addAttribute("search",search);
		return "mypage/mycgv";
	}
	
	@GetMapping("/reserve")
	public String reserve(Model model) {
		int member_no=1;
		TicketDto ticketlist = sqlSession.selectOne("mypage.ticketlist",member_no);
		System.out.println(ticketlist);
		model.addAttribute("ticketlist",ticketlist);
		return "mypage/reserve";
	}
	
	@GetMapping("/movielog")
	public String movielog() {
		
		return "mypage/movielog";
	}
	
	@GetMapping("/movielog/watched")
	public String watched() {
		
		return "mypage/watched";
	}
}
