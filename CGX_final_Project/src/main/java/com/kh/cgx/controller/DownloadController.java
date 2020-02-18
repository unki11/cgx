package com.kh.cgx.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/download")
public class DownloadController {

	@GetMapping("/img")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int file_no) throws IOException{
//		ResponseEntity : 스프링에서 응답해줄 데이터가 담긴 상자
//		ByteArrayResource : 스프링에서 관리할 수 있는 Byte 형식의 데이터셋
		File directory = new File("C:/upload/cinema");
		
		directory.mkdirs();
		File file = new File(directory, String.valueOf(file_no));
		byte[] data = FileUtils.readFileToByteArray(file);
//		실제파일을 불러온다 : physicalFileDao
//		헤더설정 및 전송은 스프링의 방식으로 진행
		ByteArrayResource resource = new ByteArrayResource(data);
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("attachment;");
		buffer.append("filename=");
		buffer.append("\"");
		buffer.append(URLEncoder.encode(String.valueOf(file_no), "UTF-8"));
		buffer.append("\"");
		
		return ResponseEntity.ok()
					//.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(data.length)
					.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
					.header(HttpHeaders.CONTENT_DISPOSITION, 
								buffer.toString())
					.body(resource);
	}
}
