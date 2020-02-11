package com.kh.cgx.controller;

import javax.servlet.http.HttpServletRequest;	
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.entity.user.MemberDto;
import com.kh.cgx.repository.user.MemberDao;


@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberDao memberDao;
	@ResponseBody
	
	// 가입 	
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/join")
	// pw 암호화
	public String join(@ModelAttribute MemberDto member) {
		// member에 있는 pw를 암호화 한다
		//		String origin = member.getMember_pw();
		//		String result = encoder.encode(origin);
		//		member.setMember_pw(result);
		member.setMember_pw(encoder.encode(member.getMember_pw()));
	
		// DB 저장
		sqlSession.insert("member.join", member);
		return "redirect:/user/login";
	}
	
	@GetMapping("/join_success")
	public String join_success() {
		return "member/join_success";
	
	}

	
	// 로그인 처리 
//import javax.servlet.http.HttpSession;	
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.kh.cgx.entity.user.MemberDto;
//import com.kh.cgx.repository.user.MemberDao;
//import com.kh.cgx.service.user.MemberServiceImpl;
//
//
//@Controller
//@RequestMapping("/user")
//public class UsersController {
//	@Autowired
//	private PasswordEncoder encoder;
//	@Autowired
//	private SqlSession sqlSession;
//	@Autowired
//	private MemberDao memberDao;
//	
//	// 가입 	
//	@GetMapping("/join")
//	public String join() {
//		return "user/join";
//	}
//	
//	@PostMapping("/join")
//	// pw 암호화
//	public String join(@ModelAttribute MemberDto member) {
//		// member에 있는 pw를 암호화 한다
//		//		String origin = member.getMember_pw();
//		//		String result = encoder.encode(origin);
//		//		member.setMember_pw(result);
//		member.setMember_pw(encoder.encode(member.getMember_pw()));
//	
//		// DB 저장
//		sqlSession.insert("member.join", member);
//		return "redirect:/user/login";
//	}
//	
//	@GetMapping("/join_success")
//	public String join_success() {
//		return "member/join_success";
//	
//	}
//
//	
//	// 로그인 처리 
////	@GetMapping("/login")
////	public String login(@RequestParam(required = false) String id, HttpSession session) {
////		session.setAttribute("id", id);
////		return "user/login";
////	}

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, @ModelAttribute MemberDto memberDto) {
		System.out.println("안녕");
		MemberDto find = memberDao.login(memberDto);
		System.out.println(find);
		if(find!=null) {//아이디가 있음
			String pw1=memberDto.getMember_pw();//회원이 가져온 비밀번호
			String pw2 =find.getMember_pw();//아이디로 검색한 비밀번호
			boolean result = pw1.equals(pw2);
			if(result) {//아이디로 검색한 비밀번호하고 회원이 입력한 비밀번호가 같다
				session.setAttribute("id",memberDto.getMember_id());
				return "home";
			}else {//다르다
				return "redirect:login?error";
			}
			
		}
		else {//아이디가 없음(로그인 실패)
//			memberDao.updateLastLogin(find);
			return "redirect:login?error";
			
		}
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		
				return "redirect:/";
	}
	
	    @ResponseBody //ajax로 보낼때 사용하는 어노테이션
	    @PostMapping("/checkId")
	    public boolean checkId(String member_id,Model  model) {
	        System.out.println("Controller.idCheck() 호출");
	        boolean result=false;
	        MemberDto memberDto=sqlSession.selectOne("member.checkId",member_id);
	        if(memberDto.getMember_id()!=null) {
	        	result= true;
	        }else {
	        	System.out.println("아이디사용가능");
	        }
	        return result;
		
	}
	
	@PostMapping("/logout")
	public String doPost(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		return "/user";
	
	}
	
	@GetMapping("/search")
	public String search() {
		
		return "user/search";
	}
	
	@GetMapping("/find_pw")
	public String find_pw() {
		
		return "user/find_pw";
	}
	
	
	@GetMapping("/find_id")
	public String find_id() {
		
		
		return "user/find_id";
	}
	
	
	@GetMapping("/pw")
	public String pw() {
		
		return "user/pw_reconfirm";
	}
	
	
	@GetMapping("/three_month_pw")
	public String three_month_pw() {
		
		return "user/three_month_pw";
}
}
//	
//	@PostMapping("/login")
//	public String login(HttpSession session, @ModelAttribute MemberDto memberDto) {
//		System.out.println("안녕");
//		MemberDto find = memberDao.login(memberDto);
//		System.out.println(find);
//		if(find==null) {//로그인 실패
//			return "redirect:login?error";
//		}
//		else {//로그인 성공
//			session.setAttribute("id", find.getMember_id());
//			session.setAttribute("pw", find.getMember_pw());
////			memberDao.updateLastLogin(find);
//			return "redirect:/";
//			
//		}
//		
//	}
//	
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//				session.removeAttribute("id");
//				return "redirect:/";
//	}
//	
//	@GetMapping("/search")
//	public String search() {
//		
//		return "user/search";
//	}
//	
//	@GetMapping("/find_pw")
//	public String find_pw() {
//		
//		return "user/find_pw";
//	}
//	
//	
//	@GetMapping("/find_id")
//	public String find_id() {
//		
//		return "user/find_id";
//	}
//	
//	
//	@GetMapping("/pw")
//	public String pw() {
//		
//		return "user/pw_reconfirm";
//	}
//	
//	
//	@GetMapping("/three_month_pw")
//	public String three_month_pw() {
//		
//		return "user/three_month_pw";
//	}
//}

//package com.kh.cgx.controller;
//
//
//import javax.servlet.http.HttpSession;	
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.kh.cgx.entity.user.MemberDto;
//import com.kh.cgx.service.user.MemberServiceImpl;
//
//
//@Controller
//@RequestMapping("/user")
//public class UsersController {
//	
//	@Autowired
//	private PasswordEncoder encoder;
//	
//	@Autowired
//	private SqlSession sqlSession;
//	
//	// 가입 	
//	@GetMapping("/join")
//	public String join() {
//		return "user/join";
//	}
//	
//	@PostMapping("/join")
//	// pw 암호화
//	public String join(@ModelAttribute MemberDto member) {
//		// member에 있는 pw를 암호화 한다
//		//		String origin = member.getMember_pw();
//		//		String result = encoder.encode(origin);
//		//		member.setMember_pw(result);
//		member.setMember_pw(encoder.encode(member.getMember_pw()));
//	
//		// DB 저장
//		sqlSession.insert("member.join", member);
//		return "redirect:/user/login";
//	}
//
//	
//	// 로그인
//	@GetMapping("/login")
//	public String login(@RequestParam(required = false) String id, HttpSession session) {
//		session.setAttribute("id", id);
//		return "user/login";
//	}
//	
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//				session.removeAttribute("id");
//				return "redirect:/";
//	}
//	
//	@GetMapping("/search")
//	public String search() {
//		
//		return "user/search";
//	}
//	
//	@GetMapping("/find_pw")
//	public String find_pw() {
//		
//		return "user/find_pw";
//	}
//	
//	
//	@GetMapping("/find_id")
//	public String find_id() {
//		
//		return "user/find_id";
//	}
//	
//	
//	@GetMapping("/pw")
//	public String pw() {
//		
//		return "user/pw_reconfirm";
//	}
//	
//	
//	@GetMapping("/three_month_pw")
//	public String three_month_pw() {
//		
//		return "user/three_month_pw";
//	}
//
//}
