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
<title>티켓 신청 내역</title>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$.noConflict();
	jQuery(document).ready(
			function($) {
				$("#datepicker1, #datepicker2").datepicker(
						{
							dateFormat : 'yy-mm-dd',
							changeMonth : 'true',
							changeYear : 'true',
							showButtonPannel : 'true',
							nextText : '다음 달',
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ]
						/* , minDate, maxDate */
						});
			});
</script>
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
		imgWin.document
				.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document
				.write("<img src="
						+ img
						+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		imgWin.document.close();
	}
	function deletecheck(num) {
		if (confirm("주문을 취소하시겠습니까?")) {
			window.location.href = "/order/cancel/" + num;
		} else {
			alert("취소되었습니다");
			return false;
		}
	}
	function change() {
		var num = document.orderList.searchNum.value;

		if (num == 2) {
			//신청날짜 선택했을 때
			return 2;
		}
		if (num == 3) {
			//주문상태 선택했을 때
			return 3;
		}
		return num;
	}
</script>
</head>
<body>
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 1%; text-align: center; vertical-align: middle;">No.</th>
				<th style="width: 29%; text-align: center; vertical-align: middle;">subject</th>
				<th style="width: 20%; text-align: center; vertical-align: middle;">E-mail(id)</th>
				<th style="width: 6%; text-align: center; vertical-align: middle;">name</th>
				<th style="width: 15%; text-align: center; vertical-align: middle;">phone</th>
				<th style="width: 10%; text-align: center; vertical-align: middle;">order
					date</th>
				<th style="width: 5%; text-align: center; vertical-align: middle;">status</th>
				<th style="width: 10%; text-align: center; vertical-align: middle;">barcode</th>
				<th style="width: 9%; text-align: center; vertical-align: middle;">tool</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${orderList }" varStatus="stat">
				<tr style="text-align: center; vertical-align: middle;">
					<td align="center" style="width: 1%;">${list.order_num }</td>
					<td align="center" style="width: 29%;"><a
						href="/order/view/${list.order_num}">${list.show_subject}</a></td>
					<td align="center" style="width: 20%;">${list.id_email }</td>
					<td align="center" style="width: 6%;">${list.name }</td>
					<td align="center" style="width: 15%;">${list.phone }</td>

					<td align="center" style="width: 10%;"><fmt:formatDate
							value="${list.order_date }" pattern="yyyy-MM-dd hh:mm" /></td>
					<td align="center" style="width: 5%;">${list.order_status }</td>
					<td align="center" style="width: 10%;"><c:choose>
							<c:when test="${list.order_status eq '티켓 신청' }">
								<img src="${imgPath}${list.barcode}.png"
									style="cursor: pointer;"
									onclick="doImgPop('${imgPath}${list.barcode}.png')" width="150" />
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose></td>
					<td align="center" style="width: 9%;"><a href="#"
						onclick="return fnConfirmMoveUrl('정말로 취소하시겠습니까?', '/order/cancel/${list.order_num }');">
							<input type="image"
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
							style="width: 16px">
					</a></td>
				</tr>
			</c:forEach>
		</tbody>

		<!-- 	</table>
	<table> -->
		<thead>

			<form:form commandName="searchModel"
				action="${contextpath }/order/search" class="form-horizontal">
				<div class="form-horizontal">
					<div class="form-inline col-md-6 col-md-offset-9">
						<div class="form-group form-group-sm">
							<label for="searchNum"> <form:select path="searchNum"
									class="form-controll">
									<form:option value="0">ID(E-mail)</form:option>
									<form:option value="1">전시회명</form:option>
									<form:option value="2">신청상태</form:option>
								</form:select>
							</label> &nbsp;
							<form:input path="searchKeyword" id="searchNum"
								class="form-controll input-sm" type="text" />
						</div>
					</div>
					<div class="form-inline col-md-6 col-md-offset-7">
						<div class="form-group form-group-sm">
							<label for="datepicker">조회기간:&nbsp;&nbsp;</label>
							<form:input path="datepicker1" id="datepicker1" type="text"
								class="form-controll input-sm" />
							&nbsp;&nbsp;~&nbsp;&nbsp;
							<form:input path="datepicker2" id="datepicker2" type="text"
								class="form-controll input-sm" />
						
						</div>
					</div>
					<div class="form-inline col-md-6 col-md-offset-11">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-default btn-xs" name="search" type="submit"
							value="검색" />
					</div>
				</div>
			</form:form>
		</thead>
	</table>

</body>
</html>