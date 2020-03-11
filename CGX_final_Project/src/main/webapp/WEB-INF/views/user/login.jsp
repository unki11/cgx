<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>

<script
	src="${pageContext.request.contextPath}/resources/js/crypto/crypto-js.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/crypto/hmac-sha256.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/crypto/secom.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<style>
	body{
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

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 

<body>

	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="${pageContext.request.contextPath}/resources/img/latte2.png" id="icon" alt="User Icon" />
			</div>

			<form action="login" method="post">
				<input type="text" id="login" class="fadeIn second" name="member_id" placeholder="아이디" required> 
				<input type="password" id="password" class="fadeIn third" name="member_pw" placeholder="비밀번호" required> <input
					type="submit" class="fadeIn fourth btn " value="Log In"
					style="background-color: #ff0206;">


				<!-- Remind Passowrd s-->
				<div id="formFooter">
					<a class="underlineHover" href="<c:url value='/user/find_id' />">아이디
						찾기</a> <a class="underlineHover"
						href="<c:url value='/user/find_pw' />">비밀번호찾기</a> <a
						class="underlineHover" href="<c:url value='/user/join' />">회원가입</a>
				</div>
			</form>
		</div>
	</div>
	
</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>   
</html>
