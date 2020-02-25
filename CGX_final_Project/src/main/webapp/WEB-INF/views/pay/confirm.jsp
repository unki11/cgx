<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>결제 정보 확인</h1>
<form action="confirm" method="post">
	<input type="text" name="partner_order_id" value="${vo.partner_order_id}"><br><br>
	<input type="text" name="partner_user_id" value="${vo.partner_user_id}"><br><br>
	<input type="text" name="item_name" value="${vo.item_name	}"><br><br>
	<input type="text" name="quantity" value="${vo.quantity}"><br><br>
	<input type="text" name="total_amount" value="${vo.total_amount}"><br><br>
	<input type="text" name="vat_amount" value="${vo.vat_amount}"><br><br>
	<input type="text" name="tax_free_amount" value="${vo.tax_free_amount}"><br><br>
	<input type="submit" value="최종 결제하기">
</form>