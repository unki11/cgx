package com.kh.cgx.repository.movie;

import java.util.List;





import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.vo.movie.AgeVO;
import com.kh.cgx.vo.movie.MovieVO;
import com.kh.cgx.vo.movie.StillcutVO;


import com.kh.cgx.entity.movie.MovieVO2;

public interface MovieDao {
//무비파인더
	List<MovieDto> finder(MovieVO2 movieVO);
//게시글 검색 결과수
//	int count(String type , Object keyword) ;
	
//	상영 예정작
	List<MovieDto> getList2();
//	무비차트
	List<MovieDto> getList3();
//해당 영화 배우 리스트
	List<String> getList4(int movie_no);
//스틸 컷
	List<StillcutVO> getStillcut(StillcutVO stillcutVO);
//	무비 파인더 검색 창
	List<MovieVO2> getList5();
//위시리스트 등록
	void insert(int member_no, int movie_no);
//위시리스트 삭제
	void delete(int member_no, int movie_no);
//연령별 예매 분포
	List<AgeVO> getAgeList(int movie_no);

	//위시리스트
	List<MovieVO> getList6(int member_no);

	
	
}
