package com.kh.cgx;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class Test01 {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		/*
		 * List<PersonVO> list = sqlSession.selectList("person.selectPerson");
		 * log.info("list 크기 = {}", list.size());
		 * 
		 * for(PersonVO person : list) { log.info("번호 : {}, 이름 : {}", person.getNo(),
		 * person.getName()); for(ScoreDto score : person.getList()) {
		 * log.info("-> 시험명 : {}, 점수 : {}", score.getName(), score.getValue()); } }
		 */
	}
	
}
