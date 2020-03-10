package com.kh.cgx.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
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

	@GetMapping("/movielog")  //@RequstPrama int member_no 받기 
	public String movielog() {

	     //위시리스트 list 쿼리 
		//List<WatchedVO> list = sqlSession.selectList("mypage.watched", member_no);
		 //model.addAttribute("list", list);  쿼리담기
	
		return "mypage/movielog";
	}

	// 위시리스트 (지현이 추가)
	@ResponseBody 
	@GetMapping("/deletewish")
	public Object deletewish (HttpSession session, @RequestParam int movie_no) {
		
//		 int member_no = 1;
		Map<String, Object> data = new HashMap<String, Object>();

		 String id = (String)session.getAttribute("id");
		 MemberDto memberDto = sqlSession.selectOne("member.login",id);
		 Map<String, Object> param = new HashMap<String, Object>();
		 param.put("member_no", memberDto.getMember_no());
		 param.put("movie_no", movie_no);
		 
		 sqlSession.delete("movies.deletewish",param); //추가하기!! 잊지말기!
 		 sqlSession.update("movies.updatewishreset", movie_no); //추가하기
		 data.put("message", "삭제완료되었습니다."); 
		
		
		 return data;
	}
	
	
	//위시리스트에서 삭제 
	@GetMapping("/movielogdelete")
	public Object delete (HttpSession session, @RequestParam int movie_no) {
		
		Map<String, Object> data = new HashMap<String, Object>();

		 String id = (String)session.getAttribute("id");
		 MemberDto memberDto = sqlSession.selectOne("member.login",id);
		 Map<String, Object> param = new HashMap<String, Object>();
		 param.put("member_no", memberDto.getMember_no());
		 param.put("movie_no", movie_no);
		 
		 sqlSession.delete("movies.deletewish",param); 
		 sqlSession.update("movies.updatewishreset", movie_no);
		 data.put("message", "삭제완료되었습니다."); 
		
		 
		 return "redirect:/mypage/movielog";
	}

	@GetMapping("/movielog/watched")
	public String watched(Model model, HttpSession session) {

		/*
		 * MemberDto memberdto = (MemberDto)session.getAttribute("MemberDto"); int
		 * member_no = memberdto.getMember_no();
		 */
		String member_id = (String)session.getAttribute("id");
		MemberDto memberDto = MemberDto.builder().member_id(member_id).build();
		MemberDto dto = memberdao.login(memberDto);
		int member_no = dto.getMember_no();
		
		List<WatchedVO> list = sqlSession.selectList("mypage.watched", member_no);
		model.addAttribute("watchList", list);

		return "mypage/watched";
	}


	@ResponseBody
	@PostMapping("/delete/user")
	public int deleteUser (HttpSession session) {
		int result = 0;
		int member_no = (int) session.getAttribute("member_no");
		
		result = sqlSession.delete("mypage.deleteUser", member_no);
		
		return result;
	}

	
//	  @GetMapping("/movielog/watched") public String watched2(Model model,
//	  HttpSession session) {
//	  
//	  String id=(String) session.getAttribute("id"); 
//	  System.out.println("id="+id);
//	  
//	  MemberDto dto=sqlSession.selectOne("member.login",id);
//	  
//	  List<WatchedVO> list = sqlSession.selectList("mypage.watched",id);
//	  model.addAttribute("watchList", list);
//	  
//	  return "mypage/watched"; }
	 
}