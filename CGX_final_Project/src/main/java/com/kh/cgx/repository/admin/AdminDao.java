package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.AdminDto;	


public interface AdminDao {
	List<AdminDto> getList();
	void insert(AdminDto adminDto);
	void delete(int no);
	void update(AdminDto adminDto);
}
