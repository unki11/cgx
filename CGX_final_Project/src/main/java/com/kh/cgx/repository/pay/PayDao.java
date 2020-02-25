package com.kh.cgx.repository.pay;

import java.util.List;

import com.kh.cgx.entity.pay.PayDto;

public interface PayDao {

	void insertReady(PayDto payDto);
	void insertSuccess(PayDto payDto);
	List<PayDto> getList();
	PayDto get(int no);
	void insertRevoke(PayDto payDto2);
}
