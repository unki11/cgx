<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>극장 등록 페이지</h1>
<form action="adminInsert" method="post">
	<!-- <input type="text" name="cinema_no" placeholder="극장번호"><br><br> -->
	<input type="text" name="files_no" placeholder="사진번호"><br><br>
	<input type="text" name="cinema_area" placeholder="극장지역"><br><br>
	<input type="text" name="cinema_phone" placeholder="극장전화번호"><br><br>
	<input type="text" name="cinema_addr" placeholder="극장주소"><br><br>
	<input type="submit" value="극장등록">
</form>