<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" name="creditForm"
		action="https://www.sandbox.paypal.com/cgi-bin/webscr">
		<!-- 구매요청 -->
		<input type="hidden" name="cmd" value="_xclick" />
		<!-- 상점 계정 -->
		<input type="hidden" name="business"
			value="bebey7410-facilitator@hanmail.net" />
		<!-- 상품 금액 -->
		<input type="hidden" name="amount" value="${orderModel.total_price }" />
		<!-- 상품 명 -->
		<input type="hidden" name="item_name" value="KONG2" />
		<!-- 결제 후 이동할 페이지 -->
		<input type="hidden" name="return"
			value="http://localhost:8080/order/success/credit/${orderModel.flag }" />
		<!-- IPN메세지 받을 페이지 -->
		<input type="hidden" name="notify_url"
			value="http://localhost:8080/order/success/credit/${orderModel.flag }" />
		<!-- 결제 취소 페이지   -->
		<input type="hidden" name="cancel_return"
			value="http://localhost:8080/main" />
		<!-- 인코딩 -->
		<input type="hidden" name="charset" value="UTF-8" />
		<!-- 결제화폐 -->
		<input type="hidden" name="currency_type" value="USD" />
	</form>

</body>
<script type="text/javascript">
	document.creditForm.submit();
</script>
</html>