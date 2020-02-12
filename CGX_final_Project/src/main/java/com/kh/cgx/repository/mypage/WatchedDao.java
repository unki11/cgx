package com.kh.cgx.repository.mypage;

import java.util.List;

import com.kh.cgx.entity.mypage.TicketDto;
import com.kh.cgx.entity.mypage.WatchedVO;

public interface WatchedDao {

		List<WatchedVO> getList();
		
		
}
