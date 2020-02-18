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
		$("#checkId").click(function() {
				var member_id = $("input[name=member_id]").val();
							$.ajax({
										url : "checkId",
										type : "get",
										contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
										data : {
											'member_id' : member_id
										},
										success : function(resp) { //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
											if(resp){
												window.alert(resp);
											console.log("중복된 아이디가 있습니다.")
											}
											else{
												window.alert(resp);
											console.log("사용가능한 아이디 입니다.")
											}
											
											//resp는 Y 아니면 N
											//Y일때 할일
											//N일때 할일
											console.log("resp = ", resp)
// 											var result = false;
// 											$(resp)
// 													.find("member_id")
// 													.each(
// 															function() { //each -각각찾는거
// 																if ($(this)
// 																		.text() === $(
// 																		"input[name=member_id]")
// 																		.val()) {
// 																	//만약에 니가 find를 실행해서 가져온 값이 글자인데 니가 입력한 값하고 같을때
// 																	result = true;
// 																}
// 															});
// 											// console.log(result);
// 											// result가 true면 아이디가 존재하는 것
// 											// result가 false면 아이디가 존재하지 않는 것
// 											if (result) { //result 는 위에  result = true; 
// 												$("input[name=member_id]")
// 														.next()
// 														.text("이미 사용중인 아이디입니다");
// 											} else {
// 												$("input[name=member_id]")
// 														.next()
// 														.text(
// 																"사 용할 수 있는 아이디입니다");
// 											}
										}
									});
						});
	});
	
	// Added
	$(function() {
		$("#checkEmail").click(function() {
			$.ajax({
				url : "<c:url value='/user/checkEmail' />",
				type : "post",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				data : {
					'member_id' : $("input[name='member_id']").val(),
					'member_email' : $("input[name='member_email']").val()
				},
				success : function(data) {
					if (data == true) {
						$("#checkEmail").hide();
						$("input[name='email_code']").show();
						$("#checkEmailCode").show();
					}
				}
			});
		});
		$("#checkEmailCode").click(function() {
			$.ajax({
				url : "<c:url value='/user/checkEmailCode' />",
				type : "post",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				data : {
					'email_code' : $("input[name='email_code']").val()
				},
				success : function(data) {
					if (data == true) {
						$("#checkEmail").hide();
						$("input[name='email_code']").hide();
						$("#checkEmailCode").hide();
						$("#msg").text("이메일 인증됨");
					} else {
						$("#checkEmail").show();
						$("input[name='email_code']").hide();
						$("#checkEmailCode").hide();
						$("#msg").text("이메일 인증실패");
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>회원가입</h1>
					<form action="join" method="post">
							<input type="text" name="member_id" placeholder="id">
							<!--  name = 값 controller에있는파라미터값변수명하고 일치해야함 -->
							<input type="button" id="checkId" value="중복확인">
						</div>
						<div>
							<input type="password" name="member_pw" placeholder="pw">
						</div>
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
							<input type="text" name="member_sex" placeholder="sex">
						</div>
						<div>
							<input type="email" name="member_email" placeholder="email">
							<input type="button" id="checkEmail" value="이메일인증">
							<input type="text" name="email_code" placeholder="인증코드" style="display:none;">
							<input type="button" id="checkEmailCode" value="인증코드확인" style="display:none;">
							<p id="msg"></p>
						</div>
						<div>
							<button type="submit">회원가입</button>
						</div>
					</form>

		<div></div>
</head>
</html>