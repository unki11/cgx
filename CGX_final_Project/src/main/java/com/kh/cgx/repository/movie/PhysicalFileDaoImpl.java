package com.kh.cgx.repository.movie;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class PhysicalFileDaoImpl implements PhysicalFileDao{

	private File directory = new File("C:\\upload");
	
	
	
	@Override
	public byte[] get(int files_no) throws IOException {
		File file = new File(directory , String.valueOf(files_no));
		byte[] data = FileUtils.readFileToByteArray(file);
		
		
		return data;
	}

}
