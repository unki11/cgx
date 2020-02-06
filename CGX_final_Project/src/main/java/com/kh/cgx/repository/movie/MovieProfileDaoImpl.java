package com.kh.cgx.repository.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.kh.cgx.entity.movie.MovieProfileDto;

public class MovieProfileDaoImpl implements MovieProfileDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<MovieProfileDto> mapper = (rs, index)->{
		return MovieProfileDto.builder()
								.files_no(rs.getInt("files_no"))
							.build();
	};
	
	@Override
	public int getSequence() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void regist() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MovieProfileDto get(int files_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
