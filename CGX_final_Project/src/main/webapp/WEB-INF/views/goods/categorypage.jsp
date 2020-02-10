<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<h1>category페이지입니다</h1>

<div class="sect-finder" align="center">
		<a href="http://localhost:8080/com.kh.cgx/goods/
				categorypage?goods_category=패키지">패키지</a>
		<a href="http://localhost:8080/com.kh.cgx/goods/
				categorypage?goods_category=콤보">콤보</a>
		<a href="http://localhost:8080/com.kh.cgx/goods/
				categorypage?goods_category=팝콘">팝콘</a>
		<a href="http://localhost:8080/com.kh.cgx/goods/
				categorypage?goods_category=음료">음료</a>
		<br><br><br><br>
	</div>

<h4>${list2}</h4>