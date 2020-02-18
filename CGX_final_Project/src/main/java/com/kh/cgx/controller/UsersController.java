package com.kh.cgx.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String join1() {
		return "user/join";
	}

	@PostMapping("/join")
	// pw 암호화
	public String join2(@ModelAttribute MemberDto member) {
		// member에 있는 pw를 암호화 한다
		 String origin = member.getMember_pw();
		 String result = encoder.encode(origin);
		 member.setMember_pw(result);
		member.setMember_pw(encoder.encode(member.getMember_pw()));

	
		//DB 즈어장
		sqlSession.insert("member.join", member);

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
	public String search1() {

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

	// Added Start
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto member, HttpSession session) {
//		[1] 검색을 해서 결과 유무를 확인한다(id만 이용해서)
		MemberDto find = sqlSession.selectOne("member.login", member);
		log.info("find = {}", find);
//		[2] 필요한 처리를 한다
		if (find == null) { // id가 없으면
			return "redirect:/login?error";
		} else {// id가 있으면 ---> 비밀번호 매칭 검사 : encoder.matches()
			boolean correct = encoder.matches(member.getMember_pw(), find.getMember_pw());
			log.info("correct = {}", correct);
			if (correct == true) {// 비밀번호 일치
				session.setAttribute("id", find.getMember_id());
				return "redirect:/";
			} else {// 비밀번호 불일치
				return "redirect:/login?error";
			}
		}
	}
	@PostMapping("/find_id")
	public String findId(@ModelAttribute MemberDto input, Model model) {
		MemberDto memberDto = memberDao.findMemberByMemberNameAndEmail(input);
		if (memberDto != null) {
			boolean sendResult = sendMail(memberDto.getMember_email(), "CGX 로그인 아이디", "CGX 로그인 아이디: " + memberDto.getMember_id());
			model.addAttribute("sendResult", sendResult);
		}
		return "user/find_id";
	}
	@PostMapping("/find_pw")
	public String findPw(@ModelAttribute MemberDto input, Model model) {
		MemberDto memberDto = memberDao.findMemberByMemberNameAndIdAndEmail(input);
		if (memberDto != null) {
			Random random = new Random();
			String pw = String.format("%04d", random.nextInt(10000));
			memberDto.setMember_pw(encoder.encode(pw));
			memberDao.updateMemberPw(memberDto);
			
			boolean sendResult = sendMail(memberDto.getMember_email(), "CGX 로그인 비밀번호", "CGX 로그인 아이디: " + memberDto.getMember_id() + ", 비밀번호: " + pw);
			model.addAttribute("sendResult", sendResult);
		}
		return "user/find_pw";
	}
	public boolean sendMail(String to, String subject, String text) {
		final String username = "lattecinema";
		final String password = "rladnsrl1234@";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true"); // TLS
		
		Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username + "@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);
			
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	@PostMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmail(@ModelAttribute MemberDto input, Model model) {
		boolean sendResult = sendMail(input.getMember_email(), "CGX 인증코드", "CGX 인증코드: 1224");
		return sendResult;
	}
	@PostMapping("/checkEmailCode")
	@ResponseBody
	public boolean checkEmailCode(@RequestParam String email_code, Model model) {
		return "1224".equals(email_code);
	}
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/user/login?error";
		} else {
			MemberDto find = memberDao.findMemberById(id);
			model.addAttribute("login", find);
		}
		return "user/mypage";
	}
	@GetMapping("/change_information")
	public String chage_information(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/user/login?error";
		} else {
			MemberDto find = memberDao.findMemberById(id);
			model.addAttribute("login", find);
		}
		return "user/change_infomation";
	}
	@PostMapping("/change_information")
	public String chageInformation(HttpSession session, @ModelAttribute MemberDto input, Model model) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/user/login?error";
		} else {
			memberDao.updateMember(input);
			MemberDto find = memberDao.findMemberById(id);
			model.addAttribute("login", find);
		}
		return "user/mypage";
	}
	// Added End

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
//		memberDao.updateLastLogin(find);
			return "redirect:reconfirm_pw?error";
		}
	}
}
