package com.kh.cgx.repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.entity.admin.ManagerDto;
import com.kh.cgx.entity.admin.ManagerReadyDto;
import com.kh.cgx.entity.cinema.CinemaDto;
import com.kh.cgx.entity.cinema.ScreenDto;
import com.kh.cgx.entity.movie.ActorDto;
import com.kh.cgx.entity.movie.MovieDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ManagerDaoImpl implements ManagerDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ManagerDto managerDto) {
		sqlSession.insert("manager.insert", managerDto);
		log.info("hhhh={}",managerDto);
	}

	@Override
	public List<MovieDto> getMovieList() {
		return sqlSession.selectList("manager.getMovieList");
		 
	}
	
	@Override
	public List<MovieDto> getMovie() {
		return sqlSession.selectList("manager.getMovieList");
		 
	}

	@Override
	public List<CinemaDto> getCinemaList(int no) {
		return sqlSession.selectList("manager.getCinemaList",no);
	}

	@Override
	public List<ScreenDto> getScreenList(int no) {
		return sqlSession.selectList("manager.getScreenList",no);
	}

	@Override
	public List<ManagerDto> getList() {
		return null;
	}

	@Override
	public void insert(ManagerReadyDto readyDto) {
		sqlSession.insert("manager.ready", readyDto);
		
	}

	@Override
	public void actorinsert(ActorDto actorDto) {
		sqlSession.insert("manager.actorinsert",actorDto);
		
	}
	
}
