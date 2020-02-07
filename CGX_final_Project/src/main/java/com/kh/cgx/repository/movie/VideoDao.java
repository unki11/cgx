package com.kh.cgx.repository.movie;

import java.util.List;

import com.kh.cgx.entity.movie.VideoDto;
import com.kh.cgx.vo.movie.VideoVO;

public interface VideoDao {

	List<VideoVO> getList(VideoVO videoVO);
}
