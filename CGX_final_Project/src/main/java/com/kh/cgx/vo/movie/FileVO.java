package com.kh.cgx.vo.movie;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//파일이 업로드 될때를 위해 만든 클래스
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class FileVO {

	private int files_no;
	private List<MultipartFile> file;
}
