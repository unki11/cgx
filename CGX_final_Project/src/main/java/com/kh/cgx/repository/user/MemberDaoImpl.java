package com.kh.cgx.repository.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cgx.entity.user.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void join(MemberDto memberDto) {
		sqlSession.insert("member.join", memberDto);

	}

	@Override
	public MemberDto login(MemberDto memberDto) {
		System.out.println("멤버 로그인중");
		System.out.println();
		return sqlSession.selectOne("member.login", memberDto);

	}

	@Override
	public void updateLastLogin(MemberDto memberDto) {
		sqlSession.update("member.updateLastLogin", memberDto.getMember_id());

	}

}
