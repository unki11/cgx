package com.kh.cgx.entity.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ManagerReadyDto {
	private int manager_no, admin_no, cinema_no;
}
