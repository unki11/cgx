package com.kh.cgx.repository.mypage;

import java.util.List;

import com.kh.cgx.entity.mypage.TicketDto;

public interface TicketDao {

		List<TicketDto> getList();
		
}
