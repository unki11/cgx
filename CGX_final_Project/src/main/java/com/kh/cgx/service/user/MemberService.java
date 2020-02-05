package com.kh.cgx.service.user;

import javax.imageio.IIOException;

import com.kh.cgx.entity.user.MemberDto;

public interface MemberService {
	void join(MemberDto memberdto) throws IllegalAccessException, IIOException;

}
