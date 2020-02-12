<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>   
    
<h1>finder페이지입니다</h1>
<br><br>

<script>
$(function(){
	//장르 체크 
//체크박스 전체 선택 및 해제
$("#all_genre").click(function(){
     if($("#all_genre").is(":checked")){
         $(".check").prop("checked",true);     
     }
     else{
         $(".check").prop("checked",false);
     }
});

//한개의 체크박스 선택 해제시 전체 선택 체크박스도 해제
$(".check").click(function(){
 if($("input[name='genre']:checked").length == 9){
     $("#all_genre").prop("checked",true);
 }else{
     $("#all_genre").prop("checked",false);
 }
});

//체크박스 전체 선택 및 해제
$("#all_national").click(function(){
     if($("#all_national").is(":checked")){
         $(".na_check").prop("checked",true);     
     }
     else{
         $(".na_check").prop("checked",false);
     }
});

//국가 체크
//한개의 체크박스 선택 해제시 전체 선택 체크박스도 해제
$(".na_check").click(function(){
 if($("input[name='genre']:checked").length == 5){
     $("#all_national").prop("checked",true);
 }else{
     $("#all_national").prop("checked",false);
 }
});

//관람등급 체크
//체크박스 전체 선택 및 해제
$("#all_grade").click(function(){
     if($("#all_grade").is(":checked")){
         $(".grade_check").prop("checked",true);     
     }
     else{
         $(".grade_check").prop("checked",false);
     }
});

//한개의 체크박스 선택 해제시 전체 선택 체크박스도 해제
$(".grade_check").click(function(){
 if($("input[name='genre']:checked").length == 4){
     $("#all_grade").prop("checked",true);
 }else{
     $("#all_grade").prop("checked",false);
 }
});


});
</script>




<div class="sect-finder" align="center">
	<h3>영화 찾아준다!!!!<h3>
	<form id="movie-search" action="${pageContext.request.contextPath }/movie/finder-test" novalidate="novalidate">
		<!-- checkbox ID 값과 label for값을 똑같이 한다 -->
		<table>
		 <tbody>
		 	<tr>
		 		<th class="searchtype" scope="row">영화검색</th>
		 			<td>
		 				<label class="hidden" for="keyword_type">영화검색 목록</label>
		 				<select title="영화검색 목록" id="keyword_type" name="type">
                                <option value="all" <c:out value="${param.type == 'all'?'selected':'' }" />>전체</option>
                                <option value="movie_title" <c:out value="${param.type == 'movie_title'?'selected':'' }"/>>영화제목</option>
                                <option value="actor_name" <c:out value="${param.type == 'actor_name'?'selected':'' }"/>>주연배우</option>
                                <option value="movie_director" <c:out value="${param.type == 'movie_director'?'selected':'' }"/>>감독</option>
                            </select>
                            <input type="text" title="영화검색 키워드입력" id="keyword_type" minlength="2" maxlength="20" style="width:410px;" placeholder="키워드를 입력해 주세요" name="keyword" value="${param.keyword }">
		 			</td>
		 	</tr>
		 	
		 	<tr>
		 		<th class="genretype" scope="row">장르</th>
		 		<td>
		 			<ul>
		 				<li>
		 					<input type="checkbox" id="all_genre" name="all-genre" value="all" class="check">
		 					<label for="all_genre">전체</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-horror" name="genre" value="호러" class="check">
		 					<label for="genre-horror">공포/호러</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-fantasy" name="movie_genre" value="판타지" class="check">
		 					<label for="genre-fantasy">판타지</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-romance" name="genre" value="로맨스" class="check">
		 					<label for="genre-romance">멜로/로맨스</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-comedy" name="genre" value="코미디" class="check">
		 					<label for="genre-comedy">코미디</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-ani" name="genre" value=애니 class="check">
		 					<label for="genre-ani">애니메이션</label>
		 				</li>
	
		 				
		 				<li>
		 					<input type="checkbox" id="genre-thriller" name="genre" value="스릴러" class="check">
		 					<label for="genre-thriller">스릴러</label>
		 				</li>
		 				

		 				<li>
		 					<input type="checkbox" id="genre-action" name="genre" value="액션" class="check">
		 					<label for="genre-action">액션</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-erotic" name="genre" value="에로" class="check">
		 					<label for="genre-erotic">에로</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre-none" name="genre" value="none" class="check">
		 					<label for="genre-none">없음</label>
		 				</li>
		 			</ul>
		 		</td>
		 	</tr>
		 	
		 	
		 	
		 	<tr>
		 		<th class="maketype" scope="row">제작국가</th>
		 		<td>
		 			<ul>
		 				<li>
		 					<input type="checkbox" name="all-national" id="all_national">
		 					<label for="all_national">전체</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_korea" name="national" value="korea" class="na_check">
		 					<label for="national_korea">한국</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_usa" name="national" value="usa" class="na_check">
		 					<label for="national_usa">미국</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_japan" name="national" value="japan" class="na_check">
		 					<label for="national_japan">일본</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_china" name="national" value="china" class="na_check">
		 					<label for="national_china">중국</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_other" name="national" value="other" class="na_check">
		 					<label for="national_other">기타</label>
		 				</li>
		 			</ul>
		 		</td>
		 	</tr>
		 	
		 	<!-- 3번째 tr 부터 -->
		 	
		 	<tr>
		 		<th class="gradetype" scope="row">관람등급</th>
		 		<td>
		 			<ul>
		 				<li>
		 					<input type="checkbox" id="all_grade" name="all-grade" value="all_grade">
		 					<label for="all_grade">전체</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade_allview" name="grade" value="allview" class="grade_check">
		 					<label for="grade_allview">전체관람가</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade_twelve" name="grade" value="twelve" class="grade_check">
		 					<label for="grade_twelve">12세 관람가</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade_fifteen" name="grade" value="fifteen" class="grade_check">
		 					<label for="grade_fifteen">15세 관람가</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade_adult" name="grade" value="adult" class="grade_check">
		 					<label for="grade_adult">청소년 관람불가</label>
		 				</li>
		 			</ul>
		 		</td>
		 	</tr>
		 </tbody>	
	</table>
	
	<div class="wrap-submit">
                    <button type="submit" class="round inred" id="btn_submit"><span>검색</span></button>
                    <button type="reset" class="round red" id="btn_reset"><span>초기화</span></button>
                </div>

	</form>
	
</div>

<br><br>
	<!-- 검색 결과 갯수 출력 -->
	${count} 개의 게시물이 있습니다.



<c:forEach var="finder_list" items="${finder_list}">

<h5>${finder_list}</h5>
<img src="download?files_no=${finder_list.files_no }">

</c:forEach>






