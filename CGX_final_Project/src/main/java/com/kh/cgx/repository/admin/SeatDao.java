package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.SeatVO;	


public interface SeatDao {
	List<SeatVO> getList();
	void insert(SeatVO seatDto);
	void delete(int no);
	void update(SeatVO seatDto);
}
