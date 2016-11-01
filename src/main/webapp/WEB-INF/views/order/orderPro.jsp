<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제</title>
<style type="text/css">
.container { /*컨테이너를 덮어서 고정 폭 사용*/
	width: 600px;
	max-width: none !important;
}
</style>
</head>
<body>
<body>
	<div class="container">
		<div class="panel panel-default">
			<!-- 위쪽 제목 -->
			<div class="panel-heading">결제 정보 입력</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${fn:length(basketList) ne 0 }">
						<c:set var="actionAddr" value="${contextpath }/order/insert_B" />
					</c:when>
					<c:otherwise>
						<c:set var="actionAddr" value="${contextpath }/order/insert" />
					</c:otherwise>
				</c:choose>

				<form:form commandName="orderModel" action="${actionAddr}"
					method="post" enctype="multipart/form-data"
					class="form-control-static">
					<table align="center" class="table-condensed">
						<tr>
							<td width="100"><label for="payment_type">일반결제</label></td>
							<td><label class="radio-inline"><form:radiobutton
										path="payment_type" id="inlineRadio1" name="payment_type"
										value="무통장입금" label="무통장입금" /> </label> <label class="radio-inline"><form:radiobutton
										path="payment_type" id="inlineRadio2" name="payment_type"
										value="신용카드" label="신용카드" /> </label> <label class="radio-inline"><form:radiobutton
										path="payment_type" id="inlineRadio3" name="payment_type"
										value="휴대폰" label="휴대폰" /> </label></td>
						</tr>
						<tr>
							<td width="100"><label for="bank_account">입금은행<font
									color="#FF0000">&nbsp;&nbsp;*</font></label></td>
							<td><form:select path="bank_account" class="form-control"
									name="bank_account">
									<form:options items="${bank_account }" />
								</form:select></td>
						</tr>
						<tr>
							<td width="100"><label for="payment_payer">입금자 명</label></td>
							<td><form:input path="payment_payer" class="form-control"
									type="text" name="payment_payer" maxlength="20"
									value="${orderModel.name}" /></td>
						</tr>
						<tr>
							<td align="right" colspan="3"><b><h2>총 신청 금액</h2></b>${orderModel.total_price }
								원</td>
						</tr>
						<tr height="50">
							<td colspan="2" align="center"><input type="submit"
								name="submit" value="결제" class="btn btn-success btn-sm">
								&nbsp;&nbsp; <input type="button" name="back" value="취소"
								onClick="javascript:history.go(-1)"
								class="btn btn-default btn-sm" /></td>
						</tr>

					</table>

					<form:hidden path="showcase_num"
						value="${orderModel.showcase_num }" />
					<form:hidden path="name" value="${orderModel.name }" />
					<form:hidden path="area" value="${orderModel.area }" />
					<form:hidden path="sex" value="${orderModel.sex }" />
					<form:hidden path="company" value="${orderModel.company }" />
					<form:hidden path="id_email" value="${orderModel.id_email }" />
					<form:hidden path="phone" value="${orderModel.phone }" />
					<form:hidden path="total_price" value="${orderModel.total_price }" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>