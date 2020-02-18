<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보페이지</title>
</head>
<body>
	<h1>내 정보 </h1>
	아이디<c:out value="${login.member_id }" /><br />
	이름<c:out value="${login.member_name }" /><br />
	전화번호<c:out value="${login.member_phone }" /><br />
	생일<c:out value="${login.member_birth }" /><br />
	성별<c:out value="${login.member_sex }" /><br />
	이메일<c:out value="${login.member_email }" /><br />
	<a href="<c:url value='/user/change_information' />">내정보변경</a>
</body>
</html>