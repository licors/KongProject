<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doImgPop(img) {
		img1 = new Image();
		img1.src = (img);
		imgControll(img);
	}

	function imgControll(img) {
		if ((img1.width != 0) && (img1.height != 0)) {
			viewImage(img);
		} else {
			controller = "imgControll('" + img + "')";
			intervalID = setTimeout(controller, 20);
		}
	}
	function viewImage(img) {
		W = img1.width;
		H = img1.height;
		O = "width=" + W + ",height=" + H + ",scrollbars=yes";
		imgWin = window.open("", "", O);
		imgWin.document.write("<html><head><title>티켓 상세보기</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document
				.write("<img src="
						+ img
						+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		imgWin.document.close();
	}
	function deletecheck() {
		if (confirm("신청을 취소하시겠습니까?")) {
		} else {
			alert("취소되었습니다");
			return false;
		}
	}
	function deleteError() {
		alert("티켓 기간이 만료되어 취소가 불가능 합니다." + "\n" + "\t1544-1234 (주)KOnG");
	}
	function deleteError2() {
		alert("이미 티켓이 취소 되었습니다." + "\n" + "\t1544-1234 (주)KOnG");
	}
</script>
<!-- <style type="text/css">
.container { /*컨테이너를 덮어서 고정 폭 사용*/
 	width: 600px;
	max-width: 600px;
} 
</style>-->
</head>
<body>
	<div class="container">
		<div class="panel panel-default col-md-6">
			<!-- 위쪽 제목 -->

			<div class="panel-body">
				<!-- 본문 -->
				<form:form commandName="orderModel" name="detailForm" method="post"
					action="${contextpath }/order/cancel/${orderModel.order_num }"
					onsubmit="return deletecheck()" class="form-control-static">

					<table width="500" align="center" class="table-condensed">
						<tr>
							<td><a href='/main/view/${orderModel.showcase_num }'
								target="_blank"> <!-- <img src="https://www.cangoto.kr/Resource/Poster/po(58).jpg" class="img-responsive"> -->
									<img src="${show_img}${orderModel.file_savname.split(',')[0]}"
									class="img-responsive">
							</a></td>
							<td>
								<h3>
									${orderModel.show_subject } <br> <small>
										${orderModel.show_addr }<br> <fmt:formatDate
											value="${orderModel.start_date }" pattern="yyyy년  MM월 dd일" />
										- <fmt:formatDate value="${orderModel.end_date }"
											pattern="yyyy년  MM월 dd일" /> <br> <c:choose>
											<c:when test="${orderModel.show_price eq 0 }">
													무료
												</c:when>
											<c:otherwise>
													${orderModel.show_price } 원
												</c:otherwise>
										</c:choose>
									</small>
								</h3>
							</td>
						</tr>

						<tr>
							<td align="right" colspan="3"><font color="#FF0000"><b>*
										${orderModel.order_status } 완료 </b></font><br> <fmt:formatDate
									value="${orderModel.order_date }" pattern="YY년  MM월 dd일" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="100"><label for="id_email">ID(E-MAIL)</label></td>
							<td><form:input path="id_email" class="form-control"
									type="text" name="id_email" maxlength="70"
									value="${orderModel.id_email}" readonly="true" /></td>
						</tr>
						<tr>
							<td width="100"><label for="name">성명</label></td>
							<td><form:input path="name" class="form-control" type="text"
									name="name" maxlength="20" value="${orderModel.name}"
									readonly="true" /></td>
						</tr>
						<tr>

							<td width="100"><label for="sex">성별</label></td>
							<td><form:input path="sex" class="form-control" type="text"
									name="sex" maxlength="20" value="${orderModel.sex}"
									readonly="true" /></td>
						</tr>
						<tr>
							<td width="100"><label for="company">회사</label></td>
							<td><form:input path="company" class="form-control"
									type="text" name="company" maxlength="20"
									value="${orderModel.company}" readonly="true" /></td>
						</tr>
						<tr>
							<td width="100"><label for="area">지역</label></td>
							<td><form:input path="area" class="form-control" type="text"
									name="area" maxlength="100" value="${orderModel.area}"
									readonly="true" /></td>
						</tr>
						<tr>
							<td width="100"><label for="phone">전화번호</label></td>
							<td><form:input path="phone" class="form-control"
									type="text" name="phone" maxlength="15"
									value="${orderModel.phone}" readonly="true" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="100"><label for="tel">티켓(바코드)</label></td>
							<td align="center" colspan="2"><c:if
									test="${orderModel.order_status eq '티켓 신청' }">
									<img src="${img }" style="cursor: pointer;"
										onclick="doImgPop('${img }')" width="400" />
								</c:if> <br> <small>* 티켓을 취소 하시면 바코드는 즉시 폐기 됩니다.</small></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="center" colspan="5"><c:if
									test="${orderModel.order_status eq '티켓 신청' }">
									<input type="submit" name="cancelTicket" value="티켓취소"
										class="btn btn-success btn-sm">
								</c:if> <!-- 상태가 '티켓 신청'이 아니면 버튼이 보이지 않음 --> <c:choose>
									<c:when test="${orderModel.member_num eq 998 }">
										<!-- 관리자일때 관리자 페이지로 이동 -->
										<input type="button" name="list" value="목록으로"
											onClick="location.href='/order/admin/list'"
											class="btn btn-default btn-sm">
									</c:when>
									<c:otherwise>
										<!-- 일반 회원일때 본인 신청 목록으로 -->
										<input type="button" name="list" value="목록으로"
											onClick="location.href='/order/list/1'"
											class="btn btn-default btn-sm">
									</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>