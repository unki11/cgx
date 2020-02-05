package com.kh.cgx.repository.user;

import com.kh.cgx.entity.user.MemberDto;

public interface MemberDao {
	int getNo();
	void join(MemberDto memberDto);

}
