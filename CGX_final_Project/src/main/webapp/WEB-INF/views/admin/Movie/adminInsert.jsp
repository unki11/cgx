<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<h1>영화 등록 페이지 </h1>
<form action="adminInsert" method="post">
	
	<input type="text" name="movie_no" placeholder="영화번호"><br><br>
	<input type="text" name="file_no" placeholder="사진번호"><br><br>
	<input type="text" name="movie_ticket_rate" placeholder="영화예매율"><br><br>
	<input type="text" name="movie_title" placeholder="영화제목"><br><br>
	<input type="text" name="movie_director" placeholder="영화감독"><br><br>
	<input type="text" name="movie_startdate" placeholder="영화개봉일자"><br><br>
	<input type="text" name= "movie_runtime" placeholder="영화상영시간"><br><br>
	<input type="text" name="movie_country" placeholder="영화국가"><br><br>
	<input type="text" name="movie_grade" placeholder="영화관람등급"><br><br>
	<input type="text" name="movie_status" placeholder="영화상영상태"><br><br>
	<input type="text" name="movie_genre" placeholder="영화장르"><br><br>
	<input type="text" name="movie_publisher" placeholder="영화배급사"><br><br>

	<input type="submit" value="영화등록">
</form>