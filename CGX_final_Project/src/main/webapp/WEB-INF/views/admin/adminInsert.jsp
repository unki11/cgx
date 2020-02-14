<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>관리자 페이지</h1>
<h3>매니저 등록</h3>

<form action="adminInsert" method="post">
	<input type="text" name="admin_no" placeholder="관리자번호"><br><br>
	<input type="text" name="admin_id" placeholder="관리자아이디"><br><br>
	<input type="password" name="admin_pw" placeholder="관리자비밀번호"><br><br>
	<input type="text" name="admin_grade" placeholder="관리자직급"><br><br>
	<input type="submit" value="등록하기">
</form>