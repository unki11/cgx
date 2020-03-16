package com.kh.cgx.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.Console;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cgx.entity.cinema.MovieTimeDto;
import com.kh.cgx.entity.cinema.SeatDto;
import com.kh.cgx.entity.mypage.TicketDto;
import com.kh.cgx.entity.mypage.TicketSeatDto;
import com.kh.cgx.entity.user.MemberDto;
import com.kh.cgx.repository.pay.PayDao;
import com.kh.cgx.service.pay.KakaoPayService;
import com.kh.cgx.vo.kakao.KakaoPayReadyVO;
import com.kh.cgx.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.cgx.vo.kakao.KakaoPaySuccessReadyVO;
import com.kh.cgx.vo.kakao.KakaoPaySuccessReturnVO;
import com.kh.cgx.vo.kakao.PayReadyReturnVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pay/kakao")
@Slf4j
public class KaKaoPayController {
	
	@Autowired
	private KakaoPayService payService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@PostMapping("/info")
	public String confirm(HttpSession session,@RequestParam List<String> seat,@RequestParam int movietime_no,Model model) throws URISyntaxException {
		int ticket_no = sqlSession.selectOne("seat.ticket");
		int screen_no = sqlSession.selectOne("movietime.screen_no",movietime_no);
		 String id=(String) session.getAttribute("id"); 	
		MemberDto search = sqlSession.selectOne("mypage.search",id);
		int member_no = search.getMember_no();
		String partner_order_id = String.valueOf(ticket_no);
		String partner_user_id = String.valueOf(member_no);
		MovieTimeDto movieTimeDto = sqlSession.selectOne("movietime.one",movietime_no);
		String item_name = sqlSession.selectOne("movietime.movietitle",movietime_no);
		int quantity =seat.size();
		int total_amount = quantity*(Integer.valueOf(movieTimeDto.getMovietime_price()));
		
		String ticket_buy_no = "12312312316571";
		
		 TicketDto ticketdto = TicketDto.builder().ticket_no(ticket_no)
							.member_no(member_no)
							.movietime_no(movietime_no)
							.ticket_buy_no(ticket_buy_no)
							.ticket_total_person(0).build();
		sqlSession.insert("seat.insertticket",ticketdto);
		
		KakaoPayReadyVO kakaoPayReadyVO = KakaoPayReadyVO.builder()
															.partner_order_id(partner_order_id)
															.partner_user_id(partner_user_id)
															.item_name(item_name)
															.quantity(quantity)
															.total_amount(total_amount)
															.vat_amount(0)
															.tax_free_amount(0)
															.build();														
		session.setAttribute("screen_no", screen_no);
		session.setAttribute("seat", seat);
		session.setAttribute("ticket_no", ticket_no);
		PayReadyReturnVO result = 
				payService.ready(kakaoPayReadyVO);	
		session.setAttribute("tid", result.getTid());
		session.setAttribute("ready",kakaoPayReadyVO);
		model.addAttribute("vo", kakaoPayReadyVO);
		return "pay/confirm";
	}
	
	@PostMapping("/confirm")
	public String confirm(@ModelAttribute KakaoPayReadyVO vo
			,HttpSession session) throws URISyntaxException {
		PayReadyReturnVO result = 
				payService.ready(vo);	
		session.setAttribute("tid", result.getTid());
		session.setAttribute("ready",vo);
		return "redirect:"+result.getNext_redirect_pc_url();
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
	
	@GetMapping("/success")
	public String success(@RequestParam String pg_token,
			HttpSession session,
			Model model) throws URISyntaxException {
		String tid = (String)session.getAttribute("tid");
		KakaoPayReadyVO vo = (KakaoPayReadyVO) session.getAttribute("ready");
		
		int ticket_no = (int) session.getAttribute("ticket_no");
		int screen_no = (int) session.getAttribute("screen_no");
		
		TicketDto ticketDto = sqlSession.selectOne("ticket.one",ticket_no);
		MemberDto memberDto = sqlSession.selectOne("member.login",session.getAttribute("id"));
		
		List<String> seat = (List<String>) session.getAttribute("seat");
		int ticket_total_person = seat.size();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ticket_no", ticket_no);
		map.put("ticket_total_person", ticket_total_person);
		sqlSession.update("seat.updateticket",map);
		
		sendMail(memberDto.getMember_email(), "예약번호", "예약번호는 "+ticketDto.getTicket_buy_no()+"입니다");
		
		List<List<String>> List = new ArrayList<List<String>>();

		for(int i = 0; i<seat.size(); i++) {
			List<String> list = new ArrayList<>();
			String a = seat.get(i);
			String [] b = a.split("-");
			list.add(b[0]);
			list.add(b[1]);
			
			List.add(list);
		} 
		for(List<String> slist : List) {
			SeatDto seatdto = new SeatDto();
			seatdto.setSeat_row(Integer.parseInt(slist.get(0)));
			seatdto.setSeat_col(Integer.parseInt(slist.get(1)));
			seatdto.setScreen_no(screen_no);
			int seat_no = sqlSession.selectOne("seat.seatsearch",seatdto);
			TicketSeatDto ticketSeatDto = TicketSeatDto.builder().seat_no(seat_no)
									.ticket_no(ticket_no)
									.build();
			 sqlSession.insert("seat.insertticket_seat",ticketSeatDto);
		}
		
		session.removeAttribute("tid");
		session.removeAttribute("ready");
		KakaoPaySuccessReadyVO data = KakaoPaySuccessReadyVO.builder()
				.cid("TC0ONETIME")
				.tid(tid)
				.partner_order_id(vo.getPartner_order_id())
				.partner_user_id(vo.getPartner_user_id())
				.pg_token(pg_token)
				.build();
		
		KakaoPaySuccessReturnVO result = payService.approve(data);
		
		model.addAttribute("result",result);
		return "pay/success";
	}
	
	@GetMapping("/fail")
	public String fail() {
		return "pay/fail";
	}
	
	@GetMapping("/cancel")
	public String cancel() {
		return "pay/cancel";
	}
	
	@Autowired
	private PayDao payDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list",payDao.getList());
		
		return "pay/list";
	}
	
	@GetMapping("/revoke")
	public String revoke(@RequestParam int no) throws URISyntaxException {
		KakaoPayRevokeReturnVO vo = payService.revoke(no);
		return "redirect:list";
	}
}
