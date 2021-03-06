<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
						url:"adminupdate",
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
				url:"admindelete?no="+adminno,
				type:"get",
				success:function(resp){
					console.log("성공")
					window.location.reload(true);
				}
			})
		})
		
	});
</script>    
<style>
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
	}

</style>			
			
			

<%-- <h1>관리자 페이지</h1>
<h3>매니저 목록</h3>

<c:forEach var="adminDto" items="${list}">
	<div>
		<p class="no">${adminDto.admin_no}</p>
		<p>아이디: ${adminDto.admin_id}</p>
		<p class="grade">${adminDto.admin_grade}</p> 
		<button class="update">수정</button>
		<button class="delete">삭제</button>
		
	</div>
</c:forEach> --%>
<html>
<body>
    <div class="container" style="text-align: center;">
      <div class="row">
        <div class="col-12">
          <h1>총괄 책임자 페이지</h1>
          <a class="underlineHover" href="/com.kh.cgx/admin/movie/admininsert">
      		<input class="btn btn-primary" value="영화등록" style="width: 120px;">
		  </a>
		  <a class="underlineHover" href="/com.kh.cgx/admin/actorinsert">
      		<input class="btn btn-secondary" value="배우등록" style="width: 120px;">
		  </a>
		  <a class="underlineHover" href="/com.kh.cgx/admin/cinema/admininsert">
      		<input class="btn btn-success" value="극장등록" style="width: 120px;">
		  </a>
		  <a class="underlineHover" href="/com.kh.cgx/admin/screen/admininsert">
      		<input class="btn btn-info" value="상영관등록" style="width: 120px;">
		  </a>
		  <a class="underlineHover" href="/com.kh.cgx/admin/admininsert">
      		<input class="btn btn-secondary" value="매니저등록" style="width: 120px;">
		  </a>
		  <br><br>
		  <a class="underlineHover" href="/com.kh.cgx/admin/movie/adminlist">
      		<input class="btn btn-primary" value="영화목록" style="width: 120px;">
		  </a>
		  <a class="underlineHover" href="/com.kh.cgx/admin/cinema/adminlist">
      		<input class="btn btn-success" value="극장목록" style="width: 120px;">
		  </a>
		  <a class="underlineHover" href="/com.kh.cgx/admin/screen/adminlist">
      		<input class="btn btn-info" value="상영관목록" style="width: 120px;">
		  </a>
		   <a class="underlineHover" href="${pageContext.request.contextPath}/admin/adminlogout">
      		<input class="btn btn-danger" value="로그아웃" style="width: 120px;">
		  </a>
		  
          <ul class="list-group">
          <c:forEach var="adminDto" items="${list}">
	          <div>
	            <li class="no">${adminDto.admin_no}</li>
	            <li class="list-group-item-danger active">${adminDto.admin_id}</li>
	            <li class="grade">${adminDto.admin_grade}</li>
	            <button class="update btn btn-warning">수정</button>
	            <button class="delete btn btn-danger">삭제</button>
	            <!-- <a class="underlineHover" href="/com.kh.cgx/admin/Screen/adminList">
      				<input class="btn btn-info" value="상영관목록보기" style="width: 160px;">
				</a> -->
	            <br><br>
	           </div>
           </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
