<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
											'member_name' : $("input[name='member_name']").val(),
											'member_phone' : $("input[name='member_phone']").val(),
											'member_birth' : $("input[name='member_birth']").val()
										},
										success : function(resp) { //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
											if (eval(resp)) {
												alert("사용가능한 아이디 입니다. 회원 가입으로 이동합니다.")
												location.href = "join.do";
											} else {
												alert("중복된 아이디가 있습니다.")
											}
										}
									});
						});
	});
</script>
</head>
<body>
	<h1>회원가입</h1>
		<div>
			<input type="text" name="member_name" placeholder="name">
		</div>
		<div>
			<input type="text" name="member_phone" placeholder="phone">
		</div>
		<div>
			<input type="text" name="member_birth" placeholder="birth">
		</div>
		<div>
			<button type="button" id="checkJoinWhether">중복여부확인</button>
		</div>
</body>
</html>