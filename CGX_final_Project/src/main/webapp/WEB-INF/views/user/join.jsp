<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/secom.js"></script>
<script>
	//해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
	$(function() {
		
		$("#join").click(function(e){
					e.preventDefault();
					joinUser();
		});
	});
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
			
// 			var checkIdYn= $('#checkIdYn').val();
// 			if (checkIdYn != 'Y') {
// 				alert("아이디 중복체크를 해주세요.");
// 				return false;
// 			}
			
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
	       $("#join").submit();
		}
</script>
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
  
      <!-- Login Form -->
      <form action="join" method="POST">
        <input type="text" id="login" class="fadeIn second" name="member_id" value="${member_id}"placeholder="아이디" readonly="readonly">
        <input type="hidden" id="checkIdYn" value="N"> 
        <input type="password" id="password" class="fadeIn third" name="member_pw" placeholder="비밀번호">
        <input type="text" id="name" class="fadeIn third" name="member_name" placeholder="이름">
        <input type="text" id="phone" class="fadeIn third" name="member_phone" placeholder="핸드폰번호">
        <input type="text" id="birth" class="fadeIn third" name="member_birth" placeholder="생년월일"><br>
       <!--  <input type="text" id="sex" class="fadeIn third" name="member_sex" placeholder="성별"> -->
              <span style="font-size: 2rem">성별 :</span><select name="member_sex" style="width: 250px; height: 50px;font-size: 2rem;text-align: center;">
                		<option>남</option>
                		<option>여</option>
                	</select>
                	<br><br><br>
        <input type="email" id="email" class="fadeIn third" style="width: 300px; height: 50px;font-size: 2rem;text-align: center;" name="member_email" placeholder="이메일">
        <input type="button" id="checkEmail" value="이메일인증">
        <input type="text" name="email_code" placeholder="인증코드" style="display:none;">
        <input type="button" id="checkEmailCode" value="인증코드확인" style="display:none;"><p id="msg"></p>
        <input type="button" id="join" class="fadeIn fourth"  value="회원가입" style="background-color: red;">

        <input type="text" id="checkEmailYn" value="N">	

      </form>
    </div>
  </div>
</body>
<jsp:include page="../footer.jsp"></jsp:include> 
</html>

  