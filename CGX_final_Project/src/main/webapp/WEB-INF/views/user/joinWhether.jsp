<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 여부확인</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/secom.js"></script>
<script>
	//해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
	$(function() {
		$("#checkJoinWhether").click(
				
						function() {
							$.ajax({
										url : "joinWhether",
										type : "post",
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										data : {
											'member_id' : $("input[name='member_id']").val(),
											'member_email' : $("input[name='member_email']").val()

										},
										success : function(resp) { //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
											console.log(resp);
											if (resp=='y') {
												var member_id = $("input[name='member_id']").val();
												alert("회원 가입이 가능합니다. 가입으로 이동합니다.")
												location.href = "join.do?member_id="+member_id;
											} else {
												alert("이미 가입된 회원입니다.")
											}
										}
									});
						});
	});
</script>
<style>
body {
	margin-top: 150px;
	background-image:
		url("${pageContext.request.contextPath}/resources/img/all.jpg");
	background-size: cover;
}

html {
	background-image:
		url("${pageContext.request.contextPath}/resources/img/latte2.png");
	background-repeat: no-repeat;
	background-position: top;
}

.container {
	opacity: 3;
	text-align: center;
	color: black;
}

.fadeIn fourth {
	background-color: red;
}
</style>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</head>

<body>

	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="${pageContext.request.contextPath}/resources/img/latte2.png" id="icon" alt="User Icon" />
			</div>

	<form action="joinWheter" method="post">
		<div>
			<input type="text" name="member_id" placeholder="id">
		</div>
		<div>
			<input type="email" name="member_email" placeholder="email">
		</div>
		<div>
			<button type="button" id="checkJoinWhether">가입여부 확인</button>
		</div>
		<form>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>   
</html>
