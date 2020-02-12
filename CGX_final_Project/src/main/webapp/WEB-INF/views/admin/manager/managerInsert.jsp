<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>매니저 페이지</h1>
<h3>상영 시간표 입력</h3>

<form action="managerInsert" method="post">
	<input type="text" name="movie_no" placeholder="영화번호">
	<select>
		
		<option value="">영화선택</option>
		<option>${movie_no}</option>
		<option>${movie_no}</option>
		<option>${movie_no}</option>
		<option>${movie_no}</option>
		<option>${movie_no}</option>
	</select>
	<br><br><br>
	
	<input type="text" name="cinema_no" placeholder="극장번호">
	<select>
		<option value="">극장선택</option>
		<option>${cinema_no}</option>
		<option>${cinema_no}</option>
		<option>${cinema_no}</option>
		<option>${cinema_no}</option>
		<option>${cinema_no}</option>
	</select>
	<br><br><br>
	
	<input type="text" name="screen_no" placeholder="상영관번호">
	<select>
		<option value="">상영관선택</option>
		<option>${screen_no}</option>
		<option>${screen_no}</option>
		<option>${screen_no}</option>
		<option>${screen_no}</option>
		<option>${screen_no}</option>
	</select>
	<br><br><br>
	<input type="text" name="movietime_tiem" placeholder="시작시간"><br><br><br>
	<input type="text" name="movietime_price" placeholder="가격"><br><br><br>
	<input type="submit" value="상영시간 등록">
</form>