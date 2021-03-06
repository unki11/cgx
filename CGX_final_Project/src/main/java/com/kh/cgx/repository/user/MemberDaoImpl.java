package com.kh.cgx.repository.user;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public int checkId(String member_id) {

		return 0;
	}

	@Override
	public MemberDto reconfirm_pw(MemberDto memberDto) {
		sqlSession.selectOne("member.reconfirm_pw", memberDto.getMember_pw());
		return null;
	}
	
	// Added Start
	@Override
	public MemberDto findMemberByMemberNameAndEmail(MemberDto input) {
		return sqlSession.selectOne("member.findMemberByMemberNameAndEmail", input);
	}
	@Override
	public MemberDto findMemberByMemberNameAndIdAndEmail(MemberDto input) {
		return sqlSession.selectOne("member.findMemberByMemberNameAndIdAndEmail", input);
	}
	@Override
	public int updateMemberPw(MemberDto input) {
		return sqlSession.update("member.updateMemberPw", input);
	}
	@Override
	public int updateMember(MemberDto input) {
		return sqlSession.update("member.updateMember", input);
	}
	@Override
	public MemberDto findMemberById(String member_id) {
		return sqlSession.selectOne("member.login", member_id);
	}
	// Added End

	@Override
	public MemberDto checkJoinWhether(MemberDto input) {
		return sqlSession.selectOne("member.checkjoinWhether", input); 
	}
}
