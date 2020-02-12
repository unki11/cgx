<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>상영관 등록 페이지</h1>

<form action="adminInsert" method="post">
	<input type="text" name="screen_no" placeholder="상영관번호"><br><br>
	<input type="text" name="cinema_no" placeholder="극장번호"><br><br>
	<input type="text" name="screen_all_seat" placeholder="전체좌석수"><br><br>
	<input type="text" name="screen_type" placeholder="상영관종류"><br><br>
	<input type="text" name="screen_name" placeholder="상영관이름"><br><br>
	<input type="text" name="screen_rowsize" placeholder="상영관줄"><br><br>
	<input type="text" name="screen_colsize" placeholder="상영관칸"><br><br>
	<input type="submit" value="상영관등록">
</form>