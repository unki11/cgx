<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 p -> 변경 click-> 재 로그인 p</title>
</head>
<body>
	<h1>내 정보 </h1>
	<form action="<c:url value='/user/change_information' />" method="post">
		<input  type="hidden" name="member_id" value="<c:out value='${login.member_id }' />">
		이름 <input  type="text" name="member_name" placeholder="이름" required value="<c:out value='${login.member_name }' />"><br/>
		전화번호<input  type="text" name="member_phone" value="<c:out value='${login.member_phone }' />"><br/>
		생일<input  type="text" name="member_birth" value="<c:out value='${login.member_birth }' />"><br/>
		성별<input  type="text" name="member_sex" value="<c:out value='${login.member_sex }' />"><br/>
		<input type="submit" value="변경">
	</form>
</body>
</html>