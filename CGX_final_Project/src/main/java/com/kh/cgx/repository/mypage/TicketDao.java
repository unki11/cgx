package com.kh.cgx.repository.mypage;

import java.util.List;

import com.kh.cgx.vo.mypage.ReserveVO;


public interface TicketDao {

		List<ReserveVO> getList();
		
}
