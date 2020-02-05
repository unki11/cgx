package com.kh.cgx.repository.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.user.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int getNo() {
		String sql = "select member_no from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void join(MemberDto memberDto) {
		String sql = "insert into member values(9,?,?,?,?,sysdate,sysdate,?,?,0)";
		Object[] param= {
				memberDto.getMember_id(),
				memberDto.getMember_pw(),
				memberDto.getMember_name(),
				memberDto.getMember_phone(),
				memberDto.getMember_birth(),
				memberDto.getMember_sex(),
				
		};
		jdbcTemplate.update(sql,param);
		}
		
	}


