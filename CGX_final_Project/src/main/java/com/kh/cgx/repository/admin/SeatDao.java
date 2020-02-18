package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.SeatVO;
import com.kh.cgx.entity.cinema.SeatDto;	


public interface SeatDao {
	List<SeatVO> getList();
	List<SeatDto> getList2();
	void insert(SeatVO seatDto);
	void delete(int no);
	void update(SeatVO seatDto);
}
