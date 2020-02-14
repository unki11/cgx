package com.kh.cgx.repository.admin;

import java.util.List;

import com.kh.cgx.entity.admin.AdminScreenDto;		


public interface AdminScreenDao {
	void insert(AdminScreenDto screenDto);
	List<AdminScreenDto> getList();
	void delete(int no);
	List<AdminScreenDto> search(int no);

}
