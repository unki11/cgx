package com.kh.cgx.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.entity.mypage.TicketDto;
import com.kh.cgx.entity.user.MemberDto;
import com.kh.cgx.repository.user.MemberDao;
import com.kh.cgx.vo.mypage.ReserveVO;
import com.kh.cgx.vo.mypage.WatchedVO;

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
	public String mycgv(Model model, HttpSession session) {
		  
	 String id=(String) session.getAttribute("id"); 	
		//찾는기능
		MemberDto search = sqlSession.selectOne("mypage.search",id);
		System.out.println(id);
		
//  System.out.println("list : "+list);
		model.addAttribute("search", search);
		return "mypage/mycgv";
	}

	@GetMapping("/reserve")
	public String reserve(Model model,HttpSession session) {
		//int member_no = 1;
		String id=(String) session.getAttribute("id"); 	
	    MemberDto dto1 = new MemberDto();
	    dto1.setMember_id(id);		
		//list
		List<ReserveVO> ticketlist = sqlSession.selectList("mypage.ticketlist", dto1.getMember_no());
	//	System.out.println(ticketlist);
		model.addAttribute("ticketlist", ticketlist);
		return "mypage/reserve";
	}

	@GetMapping("/movielog")
	public String movielog() {

		return "mypage/movielog";
	}
	
	  @GetMapping("/movielog/watched") 
	  public String watched(Model model,
	  HttpSession session) {
	  
	  String id=(String) session.getAttribute("id"); 	
	  MemberDto dto1 = new MemberDto();
	  dto1.setMember_id(id);
	//  System.out.println("id="+id);
	  MemberDto dto=sqlSession.selectOne("member.login",dto1);
	
	  List<WatchedVO> list = sqlSession.selectList("mypage.watched",dto.getMember_no());
	  model.addAttribute("watchList", list);
	  
	 return "mypage/watched"; }

	@ResponseBody
	@PostMapping("/delete/user")
	public int deleteUser (HttpSession session) {
		int result = 0;
		int member_no = (int) session.getAttribute("member_no");
		
		result = sqlSession.delete("mypage.deleteUser", member_no);
		
		return result;
	}

	/*
	 * @GetMapping("/movielog/watched") public String watched(Model model,
	 * HttpSession session) {
	 * 
	 * String id=(String) session.getAttribute("id"); System.out.println("id="+id);
	 * 
	 * MemberDto dto=sqlSession.selectOne("member.login",id);
	 * 
	 * List<WatchedVO> list = sqlSession.selectList("mypage.watched",id);
	 * model.addAttribute("watchList", list);
	 * 
	 * return "mypage/watched"; }
	 */
}