package com.kh.cgx.entity.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminNoticeDto {
	private int notice_no,admin_no;
	private String notice_title,notice_head,notice_content;
}
