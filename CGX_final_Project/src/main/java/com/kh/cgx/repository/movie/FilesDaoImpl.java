package com.kh.cgx.repository.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.movie.FilesDto;
@Repository
public class FilesDaoImpl implements FilesDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void regist(FilesDto filesDto) {
		String sql = "insert into files values(?)";
		
		Object[] param = {
		filesDto.getFiles_no()
	};
		jdbcTemplate.update(sql, param);
		

	}

}
