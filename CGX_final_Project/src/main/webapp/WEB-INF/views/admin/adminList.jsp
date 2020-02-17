<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(".update").click(function() {
			
			if($(this).text()=="수정"){
				
				var admingradeCell = $(this).parent().find(".grade");
				var admingrade = admingradeCell.text();
				/* console.log(admingrade); */ 
					admingradeCell.empty();
				
				$("<input>").val(admingrade).appendTo(admingradeCell);
				$(this).text("완료");
				
				$(this).click(function(){
					var adminno = $(this).parent().find(".no").text();
					var admingradeCell = $(this).parent().find(".grade");
					var admingrade = admingradeCell.text();
					
					var alldata = {"admin_no":adminno,"admin_grade":admingrade}
					console.log(alldata);
					$.ajax({
						url:"adminUpdate",
						type:"post",
						data: alldata,
						success:function(resp){
							console.log("성공")
						}
					});
				})
				
			}
			else{
				var admingradeCell = $(this).parent().find(".grade");
				//입력창이 하나 더 있음
				var admininput = admingradeCell.find("input");
				var admingrade = admininput.val();
				
					console.log(admingrade);
					
				admingradeCell.empty();
				admingradeCell.text(admingrade);
				
				$(this).text("수정");
			}
		
		});   
			
		
		$(".delete").click(function() {
			var adminno = $(this).parent().find(".no").text();
			$.ajax({
				url:"adminDelete?no="+adminno,
				type:"get",
				success:function(resp){
					console.log("성공")
				}
			})
		})
		
	});
/* 	alert("공지사항입니다 ");
	alert("이번주 금요일 정기 점검있습니다. 점검일시: 2020-02-12 18:00 ~ 2020-02-12 24:00"); */
</script>    
				
			
			

<h1>관리자 페이지</h1>
<h3>매니저 목록</h3>

<c:forEach var="adminDto" items="${list}">
	<div>
		<p class="no">${adminDto.admin_no}</p>
		<p>아이디: ${adminDto.admin_id}</p>
		<p class="grade">${adminDto.admin_grade}</p> 
		<button class="update">수정</button>
		<button class="delete">삭제</button>
		
	</div>
</c:forEach>
