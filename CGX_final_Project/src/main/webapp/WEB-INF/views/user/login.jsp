<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>login페이지입니다</h1>

<!-- <form action="/home/member/login.do" method="post"> -->
<form action="login" method="post">

<!-- 새로운 형태로 디자인 -->

		<h2>로그인</h2>
	
		<input  type="text" name="member_id" placeholder="ID" required>


		<input type="password" name="member_pw" placeholder="Password" required>

	
		<input type="checkbox">
		아이디 저장하기
	
		<input class="btn" type="submit" value="Login">
	<div class="row-left">
		<a href="/user/find_id.jsp">아이디 찾기</a><br>
		<a href="/user/find_pw.jsp">비밀번호 찾기</a><br>
		<a href="/user/join.jsp">회원가입</a>
	</div>

</form>

