package com.kh.cgx.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.cgx.entity.cinema.MovieTimeDto;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class MovieTimeSearchExample {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		//기능 실행을 위해 필요한 준비물(나중에 페이지에서 넘어올 파라미터)
		Map<String, Object> param = new HashMap<>();
		param.put("cinema_no", 1);
		param.put("movie_no", 1);
		param.put("date", "2020-02-25");
		
		//기능 호출(컨트롤러가 처리해줘야 하는 내용)
		List<MovieTimeDto> list = sqlSession.selectList("ticket.getMovietimeListByCinemaAndMovieAndDate", param);
		
		//결과 확인(결과 JSP페이지에 나와야 되는 내용)
		for(MovieTimeDto dto : list) {
			log.info("dto = {}", dto);
		}
	}
	
}
