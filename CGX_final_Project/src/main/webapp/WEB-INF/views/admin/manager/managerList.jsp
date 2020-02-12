<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:forEach var="managerDto" items="${list}">
	<div>
		<p class="no">${managerDto.manager_no}</p>
		<p>아이디: ${managerDto.admin_no}</p>
		<p class="grade">${manager.cinema_no}</p> 
		<button class="update">수정</button>
		<button class="delete">삭제</button>
		
	</div>
</c:forEach>