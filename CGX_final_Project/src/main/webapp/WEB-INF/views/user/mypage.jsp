<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>내정보페이지</title>
 <style>
	body{
		margin-top: 100px;
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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
      <!-- Tabs Titles -->
  
      <!-- Icon -->
      <div class="fadeIn first">
      				<img src="${pageContext.request.contextPath}/resources/img/latte2.png" id="icon" alt="User Icon" />
      </div>
  
	<h1>내 정보 </h1>
	ID <input type="text" id="login" class="fadeIn second" name="member_id" value="${login.member_id }" readonly="readonly"><br />
	이름 <input type="text" id="login" class="fadeIn second" name="member_id" value="${login.member_name }" readonly="readonly"><br />
	전화번호 <input type="text" id="login" class="fadeIn second" name="member_id" value="${login.member_phone }"  readonly="readonly"><br />
	생일 <input type="text" id="login" class="fadeIn second" name="member_birth" value="${login.member_birth }" readonly="readonly" ><br />
	성별 <input type="text" id="login" class="fadeIn second" name="member_sex" value="${login.member_sex }" readonly="readonly" ><br />
	이메일 <input type="text" id="login" class="fadeIn second" name="member_id" value="${login.member_email }"  readonly="readonly"><br />
	
	<a href="<c:url value='/user/change_information' />" ><input type="submit" value="정보변경하기" ></a>
	<a href="<c:url value='/user/change_pw' />" ><input type="submit" value="비밀번호 변경하기" ></a>
	</div>
</div>	
</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>   
</html>