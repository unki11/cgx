<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<h1>finder페이지입니다</h1>
<br><br>


<div class="sect-finder" align="center">
	<h3>영화 찾아준다!!!!<h3>
	<form id="movie-search" novalidate="novalidate">
		<!-- checkbox ID 값과 label for값을 똑같이 한다 -->
		<table>
		 <tbody>
		 	<tr>
		 		<th class="searchtype" scope="row">영화검색</th>
		 			<td>
		 				<label class="hidden" for="keyword_type">영화검색 목록</label>
		 				<select title="영화검색 목록" id="keyword_type">
                                <option value="0" selected="">전체</option>
                                <option value="1">영화제목</option>
                                <option value="2">주연배우</option>
                                <option value="3">감독</option>
                            </select>
                            <input type="text" title="영화검색 키워드입력" id="keyword" minlength="2" maxlength="20" style="width:410px;" placeholder="키워드를 입력해 주세요" value="">
		 			</td>
		 	</tr>
		 	
		 	<tr>
		 		<th class="genretype" scope="row">장르</th>
		 		<td>
		 			<ul>
		 				<li>
		 					<input type="checkbox" id="all_genre" name="all-genre" value="all">
		 					<label for="all_genre">전체</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre217" name="genre" value="217">
		 					<label for="genre217">공포/호러</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre721" name="genre" value="721">
		 					<label for="genre721">SF</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre1228" name="genre" value="1228">
		 					<label for="genre1228">멜로/로맨스</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre732" name="genre" value="732">
		 					<label for="genre732">코미디</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre727" name="genre" value="727">
		 					<label for="genre727">애니메이션</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre218" name="genre" value="218">
		 					<label for="genre218">뮤지컬</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre219" name="genre" value="219">
		 					<label for="genre219">미스터리</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre222" name="genre" value="222">
		 					<label for="genre222">범죄</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre725" name="genre" value="725">
		 					<label for="genre725">스릴러</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre225" name="genre" value="225">
		 					<label for="genre225">아동</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre224" name="genre" value="224">
		 					<label for="genre224">액션</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre728" name="genre" value="728">
		 					<label for="genre728">어드벤처</label>
		 				</li>
		 				
		 				<li>	
		 					<input type="checkbox" id="genre731" name="genre" value="731">
		 					<label for="genre731">전쟁</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre227" name="genre" value="227">
		 					<label for="genre227">환타지</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre729" name="genre" value="729">
		 					<label for="genre729">에로</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="genre1895" name="genre" value="1895">
		 					<label for="genre1895">없음</label>
		 				</li>
		 			</ul>
		 		</td>
		 	</tr>
		 	
		 	
		 	
		 	<tr>
		 		<th class="maketype" scope="row">제작국가</th>
		 		<td>
		 			<ul>
		 				<li>
		 					<input type="checkbox" name="all-national-code" id="all_national_code">
		 					<label for="all_national_code">전체</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_code_164" name="national-code" value="164">
		 					<label for="national_code_164">한국</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_code_102" name="national-code" value="102">
		 					<label for="national_code_102">미국</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_code_141" name="national-code" value="141">
		 					<label for="national_code_141">일본</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_code_143" name="national-code" value="143">
		 					<label for="national_code_143">중국</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_code_167" name="national-code" value="167">
		 					<label for="national_code_167">홍콩</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="national_code_1000" name="national-code" value="1000">
		 					<label for="national_code_1000">기타</label>
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
		 					<input type="checkbox" id="all_grade" name="all-grade" value="233">
		 					<label for="all_grade">전체</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade233" name="grade" value="233">
		 					<label for="grade233">전체관람가</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade230" name="grade" value="230">
		 					<label for="grade230">12세 관람가</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade231" name="grade" value="231">
		 					<label for="grade231">15세 관람가</label>
		 				</li>
		 				
		 				<li>
		 					<input type="checkbox" id="grade232" name="grade" value="232">
		 					<label for="grade232">청소년 관람불가</label>
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




<c:forEach var="list" items="${list }">

<h5>${list }</h5>

</c:forEach>






