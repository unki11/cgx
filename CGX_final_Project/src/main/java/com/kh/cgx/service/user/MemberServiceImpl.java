package com.kh.cgx.service.user;

import javax.imageio.IIOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cgx.entity.user.MemberDto;
import com.kh.cgx.repository.user.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void join(MemberDto memberDto) throws IllegalAccessException, IIOException {
		memberDto.setMember_no(memberDto.getMember_no());
		memberDao.join(memberDto);
		
	}

		
	}

