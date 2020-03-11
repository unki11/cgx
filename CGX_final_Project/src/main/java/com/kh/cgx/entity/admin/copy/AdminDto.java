package com.kh.cgx.entity.admin.copy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminDto {
	private int admin_no;
	private String admin_id,admin_pw,admin_grade;
}
