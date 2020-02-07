package com.kh.cgx.repository.cinema;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Repository;

@Repository
public class CinemaFileDao {

	private File directory = new File("D:/upload/cinema");
	
	
	@PostConstruct//생성하면서 실행할 메소드(준비메소드)
	public void init() {
		directory.mkdirs();
	}
	
	public byte[] get(int file_no) throws IOException {
		//directory의 위치에 있는 profile_no란 이름의 파일을 찾아서 불러온 뒤 반환
		File file = new File(directory, String.valueOf(file_no));
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;	
	}
}
