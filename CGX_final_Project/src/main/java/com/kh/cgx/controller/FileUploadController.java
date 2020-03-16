package com.kh.cgx.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cgx.entity.movie.FilesDto;
import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.movie.FilesDao;
import com.kh.cgx.vo.movie.FileVO;

@Controller
@RequestMapping("/upload")
public class FileUploadController {

	@Autowired
	private FilesDao filesDao;
	
	@Autowired
	private FilesDto filesDto;
	
	@GetMapping ("/")
	public String image() {
		return"upload/image";
	}
	
	
	@PostMapping("/upload1")
	public String upload1(
				@RequestParam String name,
				@RequestParam MultipartFile file
			) throws IllegalStateException, IOException {

		
		//분석 : 이름 ,종류 ,크기 , 실제 데이터

		
		
		//파일저장 : 저장을 할 가상의 파일 객체가 필요
		//저장경로 : C:/upload
		File dir = new File("D:/upload/kh2a");
		File target = new File(dir , String.valueOf(filesDto.getFiles_no()));
		
		dir.mkdirs();//디렉터리 생성
		file.transferTo(target);//파일저장
		
		
		
		return"redirect:./";
	}
	
	//여러개 파일 업로드
	@PostMapping("/upload2")
	public String upload2(
				@RequestParam String name,
				@RequestParam List<MultipartFile> file
			) throws IllegalStateException, IOException {
		
		//저장경로 : C:/upload에 파일을 저장
		File dir = new File("D:/upload/kh2a");
		dir.mkdirs();
		
		for(MultipartFile mf : file) {
			File target = new File(String.valueOf(filesDto.getFiles_no()));
			mf.transferTo(target);
		}
		
		return"redirect:./";
	}
	
	
	//위의 경우는 일반 데이터와 파일을 개별적으로 수신
	//-개수가 많아 지면 번거롭다
	@PostMapping("/upload3")
	public String upload3(@ModelAttribute FileVO vo) throws IllegalStateException, IOException {
//		System.out.println(vo);
		List<FilesDto> list = new ArrayList<>();
		for(MultipartFile mf : vo.getFile()) {
			list.add(filesDto.builder()
										.files_no(vo.getFiles_no())
										.build());
		}
		File dir = new File("D:/upload/kh2a");
		for(int i = 0 ; i < list.size();i++) {
			MultipartFile mf = vo.getFile().get(i);
			FilesDto dto = list.get(i);
			File target = new File(dir , String.valueOf(dto.getFiles_no()));
			mf.transferTo(target);
			filesDao.regist(dto);
			
			
		}
		return"redirect:./";
	}
	
	
	
	

}
