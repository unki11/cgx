<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
												console.log("사용가능한 아이디 입니다.")
											 $('#checkIdYn').val("Y");
											}
											else{
												window.alert(resp);
												console.log("중복된 아이디가 있습니다.")
											 $('#checkIdYn').val("N");
											}
											
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
						$('#checkEmailYn').val("Y");
					} else {
						$("#checkEmail").show();
						$("input[name='email_code']").hide();
						$("#checkEmailCode").hide();
						$("#msg").text("이메일 인증실패");
						$('#checkEmailYn').val("N");
					}
				}
			});
		});
	});
	
	function joinUser() {
			if ($('input[name="member_id"]').val() == "") {
				alert("아이디를 입력해주세요");
				return false;
			}
			
			var checkIdYn= $('#checkIdYn').val();
			if (checkIdYn != 'Y') {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if ($('input[name="member_pw"]').val() == "") {
				alert("비밀번호를 입력해주세요");
				return false;
			}
			
			if ($('input[name="member_name"]').val() == "") {
				alert("이름을 입력해주세요");
				return false;
			}
			
			if ($('input[name="member_birth"]').val() == "") {
				alert("생년월일을 입력해주세요");
				return false;
			}
			
			if ($('input[name="member_sex"]').val() == "") {
				alert("성별을 입력해주세요");
				return false;
			}
			
			var checkEmailYn = $('#checkEmailYn').val();
			if (checkEmailYn != 'Y') {
				alert("이메일 확인을 해주세요.");
				return false;
			}
	        $("#frm").submit();
		}
</script>
<style>
    .fadeIn fourth{
        background-color: red;
    }
    #checkId,#checkEmail{
        background-color: red;
    }
</style>
</head>
<body>

<div class="wrapper fadeInDown">
    <div id="formContent">
      <!-- Tabs Titles -->
  
      <!-- Icon -->
      <div class="fadeIn first">
      				<img src="${pageContext.request.contextPath}/resources/img/latte2.png" id="icon" alt="User Icon" />
      </div>
  
      <!-- Login Form -->
      <form action="join" method="POST">
        <input type="text" id="login" class="fadeIn second" name="member_id" placeholder="아이디">
        <input type="button" id="checkId" value="중복확인"><br>
        <input type="password" id="password" class="fadeIn third" name="member_pw" placeholder="비밀번호">
        <input type="text" id="name" class="fadeIn third" name="member_name" placeholder="이름">
        <input type="text" id="phone" class="fadeIn third" name="member_phone" placeholder="핸드폰번호">
        <input type="text" id="birth" class="fadeIn third" name="member_birth" placeholder="생년월일">
        <input type="text" id="sex" class="fadeIn third" name="member_sex" placeholder="성별">
        <input type="text" id="email" class="fadeIn third" name="member_email" placeholder="이메일">
        <input type="button" id="checkEmail" value="이메일인증">
        <input type="text" name="email_code" placeholder="인증코드" style="display:none;">
        <input type="button" id="checkEmailCode" value="인증코드확인" style="display:none;"><p id="msg"></p>
        <input type="submit" class="fadeIn fourth" value="회원가입" style="background-color: red;">
      </form>
  
    </div>
  </div>
</body>
</html>