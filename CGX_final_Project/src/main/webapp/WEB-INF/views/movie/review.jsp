	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<body style="margin: auto;">
<div >
<form action="review" method="post">
	예매번호 : <input type="text" name="ticket_no" value="${ticket_no}"><br>
	리뷰에그<input type="checkbox" name="review_egg" value="1"><br>
	리뷰내용<input type="text" name="review_content"><br>
	감독연출<input type="checkbox" name="review_1" value="1"><br>
	OST<input type="checkbox" name="review_2" value="1"><br>
	스토리<input type="checkbox" name="review_3" value="1"><br>
	배우연기<input type="checkbox" name="review_4" value="1"><br>
	영상미<input type="checkbox" name="review_5" value="1"><br>
	<input type="submit">
</form>
</div>
</body>
