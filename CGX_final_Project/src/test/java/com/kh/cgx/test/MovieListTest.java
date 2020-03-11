package com.kh.cgx.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.movie.MovieDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class MovieListTest {
	
	@Autowired
	private MovieDao movieDao;
	
	@Test
	public void test() {
		List<MovieDto> list = movieDao.getList3();
		for(MovieDto dto : list) {
			log.info("dto = {}", dto);
		}
	}
}
