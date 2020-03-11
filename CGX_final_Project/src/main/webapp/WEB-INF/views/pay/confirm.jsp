<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>결제 정보 확인</h1>
<article style="margin: auto;text-align: center;">
<div style="width: 400px;margin: auto;">
<form action="confirm" method="post">
	<input type="hidden" name="partner_order_id" value="${vo.partner_order_id}"><br><br>
	<input type="hidden" name="partner_user_id" value="${vo.partner_user_id}"><br><br>
	영화제목 : <input type="text" name="item_name" value="${vo.item_name	}" readonly="readonly"><br><br>
	좌석 수 : <input type="text" name="quantity" value="${vo.quantity}" readonly="readonly"><br><br>
	최종 가격 : <input type="text" name="total_amount" value="${vo.total_amount}"><br><br>
	<input type="hidden" name="vat_amount" value="${vo.vat_amount}"><br><br>
	<input type="hidden" name="tax_free_amount" value="${vo.tax_free_amount}"><br><br>
	<input type="submit" value="최종 결제하기">
</form>
</div>
</article>