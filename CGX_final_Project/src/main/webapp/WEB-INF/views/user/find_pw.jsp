<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 비번찾기 페이지 입니다</h1>
	<form action="<c:url value='/user/find_pw' />" method="post">
		<input  type="text" id="member_name" name="member_name" placeholder="이름" required>
		<input  type="text" id="member_id" name="member_id" placeholder="아이디" required>
		<input  type="text" id="member_email" name="member_email" placeholder="이메일" required>
		<input type="submit" value="찾기">
	</form>
	<% if (request.getAttribute("sendResult") != null) { %>
	메일발송됨
	<% } %>
	<a href="<c:url value='/user/login' />">로그인</a>
</body>
</html>