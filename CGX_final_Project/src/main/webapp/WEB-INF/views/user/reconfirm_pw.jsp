<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script>
	//해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
	$(function() {
		$("#reconfirm_pw").click(function() {
				var member_pw = $("input[name=member_pw]").val();
							$.ajax({
										url : "reconfirm_pw",
										type : "get",
										contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
										data : {
											'member_pw' : member_pw
										},
										success : function(resp) { //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
											if(resp){
												window.alert(resp);
											console.log("비밀번호가 확인되었습니다.")
											}
											else{
												window.alert(resp);
											console.log("비밀번호가 일치하지 않습니다.")
											}
											
										}
									});
						});
	});
	</script>
	</head>
	<body>
		<h1>비밀번호 재확인</h1>
						<form action="reconfirm_pw" method="post">
								<input type="password" name="member_pw" placeholder="pw">
								<!--  name = 값 controller에있는파라미터값변수명하고 일치해야함 -->
								<input type="button" id="reconfirm_pw" value="비밀번호확인">
							<div>
								<button type="submit">확인</button>
							</div>
						</form>

			<div></div>
	</head>
	</html>