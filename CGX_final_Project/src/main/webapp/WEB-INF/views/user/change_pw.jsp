<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀 번호 바꾸기</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/secom.js"></script>

	<style>
			margin-top: 150px;
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
		background-size: cover;
	}
	html{
		background-image: url("${pageContext.request.contextPath}/resources/img/latte2.png");
		background-repeat: no-repeat;
		background-position: top;
	}
	
	.container{
		opacity: 3;
		text-align: center;
		color: black;
	}
	.fadeIn fourth{
        background-color: red;
    }
	</style>
</head>
<jsp:include page="../header.jsp"></jsp:include> 
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
      <!-- Tabs Titles -->
  
      <!-- Icon -->
      <div class="fadeIn first">
      				<img src="${pageContext.request.contextPath}/resources/img/latte2.png" id="icon" alt="User Icon" />
      </div>
      
	<form action="change_pw" method="post">
		<input type="password" name="member_pw" placeholder="바꿀 비밀번호">
		<input type="submit">
	</form>
</body>
</html>