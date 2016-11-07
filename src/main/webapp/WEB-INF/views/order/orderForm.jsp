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
<title>신청 폼</title>
<script type="text/javascript">
	function begin() {
		document.orderForm.name.focus();
	}
	function checkIt() {
		var orderForm = eval("document.orderForm");

		if (!orderForm.name.value) {
			alert("신청인 이름을 입력하세요");
			document.orderForm.name.focus();
			return false;
		}
		if (!orderForm.tel.value) {
			alert("신청인 핸드폰번호를 입력하세요");
			document.orderForm.tel.focus();
			return false;
		}

		document.orderForm.action = "/order/pro";
		document.orderForm.submit();
	}
	function checkIt2() {
		var orderForm = eval("document.orderForm");

		if (!orderForm.name.value) {
			alert("신청인 이름을 입력하세요");
			document.orderForm.name.focus();
			return false;
		}
		if (!orderForm.tel.value) {
			alert("신청인 핸드폰번호를 입력하세요");
			document.orderForm.tel.focus();
			return false;
		}

		document.orderForm.action = "/order/pro_B";
		document.orderForm.submit();
	}
</script>
<style type="text/css">
.container { /*컨테이너를 덮어서 고정 폭 사용*/
	width: 600px;
	max-width: none !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<!-- 위쪽 제목 -->
			<div class="panel-heading">티켓 신청</div>
			<div class="panel-body">
				<!-- 본문 -->
				<!-- 장바구니에서 넘어왔을때 -->
				<%-- <c:set var="bListSize" value="${fn:length(basketList) }" />  --%>
				<c:choose>
					<%-- <c:when test="${bListSize != 0 }"> --%>
					<c:when test="${fn:length(basketList) ne 0 }">
						<%-- <form name="orderForm" method="post" onsubmit="return checkIt2();"
						class="form-control-static"> --%>
						<form:form commandName="orderModel"
							action="${contextpath }/order/pro_B" method="post"
							enctype="multipart/form-data" class="form-control-static">
							<form:hidden path="total_price"
								value="${orderModel.total_price }" />
							<table align="center" class="table-condensed">
								<c:forEach items="${basketList}" var="basket" varStatus="status">
									<tr>
										<td><img src="${show_img}${basket.file_savname.split(',')[0]}" class="img-responsive"></td>
										<td>
											<!-- <h3>
											<s:property value="subject" />
											<br> <small> <s:property value="address2" /><br>
												<s:property value="date" />
											</small>
										</h3> -->
											<h3>
												${basket.subject } <br> <small>
													${basket.address2 }<br> <fmt:formatDate
														value="${basket.start_date }" pattern="yyyy년  MM월 dd일" />
													- <fmt:formatDate value="${basket.end_date }"
														pattern="yyyy년  MM월 dd일" /><br> ${basket.price }
												</small>
											</h3>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<hr size="3">
										</td>
									</tr>
								</c:forEach>

								<tr>
									<td align="right" colspan="3"><h3>총 신청
											금액:${orderModel.total_price }</h3></td>
								</tr>

								<tr>
									<td align="right" colspan="3"><font color="#FF0000">*</font>는
										필수 입력 사항입니다.</td>
								</tr>

								<tr>
									<td width="100"><label for="id_email">ID(E-MAIL)</label></td>
									<td><form:input path="id_email" class="form-control"
											type="text" name="id_email" size="50" maxlength="70"
											value="${memberModel.id_email}" readonly="true" /></td>
								</tr>
								<tr>
									<td width="100"><label for="name">성명<font
											color="#FF0000">&nbsp;&nbsp;*</font></label></td>
									<td><form:input path="name" class="form-control"
											type="text" name="name" size="10" maxlength="20"
											value="${memberModel.name }" /></td>
								</tr>
								<tr>

									<td width="100"><label for="sex">성별</label></td>
									<td><label class="radio-inline"><form:radiobutton
												path="sex" id="inlineRadio1" name="sex" value="남성"
												label="남성" /> </label> <label class="radio-inline"><form:radiobutton
												path="sex" id="inlineRadio2" name="sex" value="여성"
												label="여성" /> </label></td>
								</tr>
								<tr>
									<td width="100"><label for="company">회사</label></td>
									<td><form:input path="company" class="form-control"
											type="text" name="company" size="10" maxlength="20"
											value="${memberModel.company}" /></td>
								</tr>
								<tr>
									<td width="100"><label for="area">거주지역</label></td>
									<td><form:select path="area" class="form-control"
											name="area">
											<form:options items="${areaOptions }" />
										</form:select></td>
								</tr>
								<tr>
									<td width="100"><label for="phone">전화번호<font
											color="#FF0000">&nbsp;&nbsp;*</font></label></td>
									<td><form:input path="phone" class="form-control"
											type="text" name="phone" size="15" maxlength="15"
											value="${memberModel.phone }" /></td>
								</tr>

								<tr>
									<td colspan="2"><textarea name="agreecheck" cols="60"
											rows="10" class="form-control">행사 및 서비스를 예약 및 구매하고자 할 경우, 원활한 서비스 제공을 위해 필요한 최소한의 개인정보만을 관련 기업에게 아래와 같이 공유하고 있습니다.

귀하께서 행사 및 서비스의 주최기업(판매자)로부터 상품 및 입장권 및 서비스를 예약하거나 구매하고자 할 경우, 원활한 서비스 제공을 위해서 필요한 최소한의 개인정보만을, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2 (개인정보 제공 동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. “개인정보공유 동의”를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다. 이용목적이 달성되고 보유기간이 종료된 이후에는 고객의 개인정보를 지체없이 파기합니다.

“개인정보 공유 동의”를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.

동의 거부 시 불이익 :
본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 행사의 참여나 상품구매가 제한될 수있습니다. 회원 가입 시 동의하신 바 있는 개인정보 제3자 제공 및 개인정보 취급 위탁에 대한 동의를 철회하고자 하는경우에는 고객센터로 연락 주시기 바랍니다.
								</textarea></td>
								</tr>
								<tr>
									<td width="30" colspan="2" align="center">▶ <b><font
											color="black" size="2">개인정보제3자 제공동의</font><br> <label
											class="radio-inline"><input type="radio"
												id="inlineCheckbox1" name="same" value="y"> 예</label> <label
											class="radio-inline"><input type="radio"
												id="inlineCheckbox2" name="same" value="n" checked="">
												아니오 </label></b>
									</td>
								</tr>
								<tr height="50">
									<td colspan="2" align="center"><input type="submit"
										name="submit" value="신청" class="btn btn-success btn-sm">
										&nbsp;&nbsp; <input type="button" name="back" value="취소"
										onClick="javascript:history.go(-1)"
										class="btn btn-default btn-sm" /></td>
								</tr>
							</table>
						</form:form>
					</c:when>
					<c:otherwise>
						<!-- 상세보기, 메인에서 구매하기 -->
						<form:form commandName="orderModel"
							action="${contextpath }/order/pro" method="post"
							enctype="multipart/form-data" class="form-control-static">
							<!-- 수정! memresultClass=MemberVO, goods_resultClass= -->
							<!-- <s:hidden name="member_num"
							value="%{memresultClass.getMember_num()}" />
						<s:hidden name="showboard_num"
							value="%{show_resultClass.showboard_num}" />
						클래스명 수정하기
						<s:hidden name="subject" value="%{show_resultClass.subject}" />
						<s:hidden name="address2" value="%{show_resultClass.address2}" /> -->
							<form:hidden path="showcase_num"
								value="${showcaseModel.showcase_num}" />
							<form:hidden path="show_subject" value="${showcaseModel.subject}" />
							<form:hidden path="show_addr" value="${showcaseModel.address2 }" />
							<%-- <form:hidden path="start_date"
								value="${showcaseModel.start_date }" />
							<form:hidden path="end_date" value="${showcaseModel.end_date }" /> --%>
							<form:hidden path="show_price" value="${showcaseModel.price }" />
							<form:hidden path="total_price" value="${showcaseModel.price }" />

							<table width="500" align="center" class="table-condensed">
								<tr>
									<td>
										 <img src="${show_img}${showcaseModel.file_savname.split(',')[0]}" class="img-responsive">
									</td>
									<td>
										<h3>
											${showcaseModel.subject } <br> <small>
												${showcaseModel.address2 }<br> <fmt:formatDate
													value="${showcaseModel.start_date }"
													pattern="yyyy년  MM월 dd일" /> - <fmt:formatDate
													value="${showcaseModel.end_date }" pattern="yyyy년  MM월 dd일" />
												<br>${showcaseModel.price } 원

											</small>
										</h3>
									</td>
								</tr>

								<tr>
									<td align="right" colspan="3"><font color="#FF0000">*</font>는
										필수 입력 사항입니다.</td>
								</tr>

								<tr>
									<td align="right" colspan="3"><b><h2>총 신청 금액</h2></b>${showcaseModel.price }
										원</td>
								</tr>

								<tr>
									<td width="100"><label for="email">ID(E-MAIL)</label></td>
									<td><form:input path="id_email" class="form-control"
											type="text" name="id_email" maxlength="70"
											value="${memberModel.id_email}" readonly="true" /></td>
								</tr>
								<tr>
									<td width="100"><label for="name">성명<font
											color="#FF0000">&nbsp;&nbsp;*</font></label></td>
									<td><form:input path="name" class="form-control"
											type="text" name="name" maxlength="20"
											value="${memberModel.name }" /></td>
								</tr>
								<tr>

									<td width="100"><label for="sex">성별</label></td>
									<td><label class="radio-inline"><form:radiobutton
												path="sex" label="남성" id="inlineRadio1" name="sex"
												value="남성" /> </label> <label class="radio-inline"><form:radiobutton
												path="sex" label="여성" id="inlineRadio2" name="sex"
												value="여성" /></label></td>
								</tr>
								<tr>
									<td width="100"><label for="company">회사</label></td>
									<td><form:input path="company" class="form-control"
											type="text" name="company" size="15" maxlength="20"
											value="${memberModel.company}" /></td>
								</tr>
								<tr>
									<td width="100"><label for="area">거주지역</label></td>
									<td><form:select path="area" class="form-control"
											name="area">
											<form:options items="${areaOptions }" />
										</form:select></td>
								</tr>
								<tr>
									<td width="100"><label for="tel">전화번호<font
											color="#FF0000">&nbsp;&nbsp;*</font></label></td>
									<td><form:input path="phone" class="form-control"
											type="text" name="phone" maxlength="15"
											value="${memberModel.phone }" /></td>
								</tr>

								<tr>
									<td colspan="2"><textarea name="agreecheck" rows="10"
											class="form-control">행사 및 서비스를 예약 및 구매하고자 할 경우, 원활한 서비스 제공을 위해 필요한 최소한의 개인정보만을 관련 기업에게 아래와 같이 공유하고 있습니다.

귀하께서 행사 및 서비스의 주최기업(판매자)로부터 상품 및 입장권 및 서비스를 예약하거나 구매하고자 할 경우, 원활한 서비스 제공을 위해서 필요한 최소한의 개인정보만을, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2 (개인정보 제공 동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. “개인정보공유 동의”를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다. 이용목적이 달성되고 보유기간이 종료된 이후에는 고객의 개인정보를 지체없이 파기합니다.

“개인정보 공유 동의”를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.

동의 거부 시 불이익 :
본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 행사의 참여나 상품구매가 제한될 수있습니다. 회원 가입 시 동의하신 바 있는 개인정보 제3자 제공 및 개인정보 취급 위탁에 대한 동의를 철회하고자 하는경우에는 고객센터로 연락 주시기 바랍니다.
								</textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="center">▶ <b><font
											color="black" size="2">개인정보제3자 제공동의</font><br> <label
											class="radio-inline"><input type="radio"
												id="inlineCheckbox1" name="same" value="y"> 예</label> <label
											class="radio-inline"><input type="radio"
												id="inlineCheckbox2" name="same" value="n" checked="">
												아니오 </label></b>
									</td>
								</tr>
								<tr height="50">
									<td colspan="2" align="center"><input type="submit"
										name="submit" value="신청" class="btn btn-success btn-sm">
										&nbsp;&nbsp; <input type="button" name="back" value="취소"
										onClick="javascript:history.go(-1)"
										class="btn btn-default btn-sm" /></td>
								</tr>
							</table>
						</form:form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>