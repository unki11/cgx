<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<body>
	<h1>아이디 찾기 </h1>
	<input  type="text" id="member_name" name="member_name" placeholder="이메일" required>

	<input type="submit" value="찾기">

</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>