package com.kh.cgx.repository.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cgx.vo.movie.DistVO;

@Repository
public class DistDaoImpl implements DistDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DistVO> getList(DistVO distVO) {
		
		return sqlSession.selectList("movies.dist_list");
	}

}
