package com.kh.cgx.repository.user;

import com.kh.cgx.entity.user.MemberDto;

public interface MemberDao {
	//회원가입
	void join(MemberDto memberDto);
	
	//로그인
	MemberDto login(MemberDto memberDto);

	void updateLastLogin(MemberDto memberDto);
	
	//아이디 중복체크
	int checkId(String member_id);
}
