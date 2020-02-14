package com.kh.cgx.controller;

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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberDao memberDao;

	// 가입
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}

	@PostMapping("/join")
	// pw 암호화
	public String join(@ModelAttribute MemberDto member) {
		// member에 있는 pw를 암호화 한다
		// String origin = member.getMember_pw();
		// String result = encoder.encode(origin);
		// member.setMember_pw(result);
		member.setMember_pw(encoder.encode(member.getMember_pw()));
	
		//DB 즈어장
		sqlSession.insert("Member.join", member);
		return "redirect:/user/login";
	}

	@GetMapping("/join_success")
	public String join_success() {
		return "/";

	}

	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto member) {
//		[1] 검색을 해서 결과 유무를 확인한다(id만 이용해서)
		MemberDto find = sqlSession.selectOne("member.login",member);
		log.info("find = {}", find);
//		[2] 필요한 처리를 한다
		if(find == null) { //id가 없으면
			return "redirect:/login?error";
		}
		else {//id가 있으면 ---> 비밀번호 매칭 검사 : encoder.matches()
			boolean correct = encoder.matches(member.getMember_pw(), find.getMember_pw());
			log.info("correct = {}", correct);
			if(correct == true) {//비밀번호 일치
				return "redirect:/";
			}
			else {//비밀번호 불일치
				return "redirect:/login?error";
			}
		}
	}
	


	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");

		return "redirect:/";
	}

	@ResponseBody // ajax로 보낼때 사용하는 어노테이션
	@GetMapping("/checkId")
	public String checkId(String member_id, Model model) {
		// 멤머에 아이디를 쏴줌. checkId로
		System.out.println("Controller.idCheck() 호출");
		MemberDto memberDto = sqlSession.selectOne("member.checkId", member_id);
		if (memberDto != null) {
			return "중복된 아이디가 있습니다.";
		} else {
			return "사용가능한 아이디 입니다.";
		}
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

	@GetMapping("/reconfirm_pw")
	public String reconfirm_pw() {
		return "/user/reconfirm_pw";
	}

	@PostMapping("/reconfirm_pw")
	public String reconfirm_pw(MemberDto memberDto) {
		System.out.println("비번재확");
		MemberDto reconfirm_pw = memberDao.reconfirm_pw(memberDto);
		System.out.println(reconfirm_pw);
		if (reconfirm_pw != null) {// 비번이 맞을 경우
			String pw1 = memberDto.getMember_pw();// 회원이 가져온 비밀번호
			String pw2 = reconfirm_pw.getMember_pw();// ㅉ아이디로 검색한 비밀번호
			boolean result = pw1.equals(pw2);
			if (result) {// 아이디로 검색한 비밀번호하고 회원이 입력한 비밀번호가 같다
				return "user/mypage";
			} else {// 다르다
				return "redirect:reconfirm_pw?error";
			}

		} else {// 비밀번호가 다름
//			memberDao.updateLastLogin(find);
			return "redirect:reconfirm_pw?error";
		}
	}
}

