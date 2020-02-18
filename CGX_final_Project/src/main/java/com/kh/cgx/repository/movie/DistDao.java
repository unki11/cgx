package com.kh.cgx.repository.movie;

import java.util.List;

import com.kh.cgx.vo.movie.DistVO;

public interface DistDao {

	List<DistVO> getList(DistVO distVO);
}
