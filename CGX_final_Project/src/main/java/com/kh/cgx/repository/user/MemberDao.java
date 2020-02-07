package com.kh.cgx.repository.user;

import com.kh.cgx.entity.user.MemberDto;

public interface MemberDao {
	void join(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);

	void updateLastLogin(MemberDto memberDto);

}
