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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
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
			window.location.href = "/order/adminOrderCancel.action?order_num="
					+ num;
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
			<tr style="text-align: center; vertical-align: middle;">
				<th style="width: 1%;">No.</th>
				<th style="width: 20%;">E-mail(id)</th>
				<th style="width: 10%;">name</th>
				<th style="width: 20%;">phone</th>
				<th style="width: 25%;">subject</th>
				<th style="width: 10%;">order date</th>
				<th style="width: 5%;">status</th>
				<th style="width: 9%;">barcode</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${orderList }" varStatus="stat">
				<tr style="text-align: center; vertical-align: middle;">
					<td align="left" style="width: 1%;">${list.order_num }</td>
					<td align="center" style="width: 20%;">${list.id_email }</td>
					<td align="center" style="width: 10%;">${list.name }</td>
					<td align="center" style="width: 20%;">${list.phone }</td>
					<td align="center" style="width: 25%;"><a href="/order/view/${list.order_num}">${list.show_subject}</a></td>
					<td align="center" style="width: 10%;"><fmt:formatDate
							value="${order.order_date }" pattern="yyyy-MM-dd hh:mm" /></td>
					<td align="center" style="width: 5%;">${list.order_status }</td>
					<td align="center" style="width: 9%;">바코드이미지 <c:choose>
							<c:when test="${list.order_status eq '티켓 신청' }">
								<img src="../barcodeImg/${list.barcode}.png"
									style="cursor: pointer;"
									onclick="doImgPop('../barcodeImg/${barcode}.png')"  />
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<thead>
			<form:form commandName="searchModel"
				action="${contextpath }/order/search">
				<tr align="center">
					<td colspan="8">
						<div class="form-inline">
							<div class="form-group">
								<div class="col-md-3" style="padding-right: 0px;">
									<form:select path="searchNum">
										<form:option value="0">ID(E-mail)</form:option>
										<form:option value="1">전시회명</form:option>
										<form:option value="2">신청상태</form:option>
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-3" style="padding-left: 0px;">
									<input class="searchk form-control" type="text"
										name="searchKeyword" size="15" maxlength="20" />
								</div>
							</div>
						</div>
						<div class="form-inline">
							<div class="form-group">
								<p>조회기간:</p>
							</div>
							<div class="form-group">
								<div class="col-md-3">
									<form:input path="datepicker1" id="datepicker1"
										name="datepicker1" type="text" class="form-control" />
								</div>
							</div>
							<div class="form-group">~</div>
							<div class="form-group">
								<div class="col-md-3">
									<form:input path="datepicker2" id="datepicker2"
										name="datepicker2" type="text" class="form-control" />
								</div>
							</div>
						</div> <input class="btn btn-default btn-xs" name="search" type="submit"
						value="검색" />
					</td>
				</tr>
			</form:form>
		</thead>
	</table>
</body>
</html>