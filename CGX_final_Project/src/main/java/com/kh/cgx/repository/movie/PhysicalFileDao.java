package com.kh.cgx.repository.movie;

import java.io.IOException;

import org.springframework.stereotype.Repository;

@Repository
public interface PhysicalFileDao {

		byte[]get(int files_no) throws IOException;
	
}
