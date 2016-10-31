<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.HashMap"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 메인 드랍다운용 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 리스트</title>
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
				.write("<html><head><title>티켓 상세보기</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document
				.write("<img src="
						+ img
						+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		imgWin.document.close();
	}
	function deletecheck(num) {
		if (confirm("신청을 취소하시겠습니까?")) {
			window.location.href = '/order/orderCancel.action?order_num=' + num;
		} else {
			alert("취소되었습니다");
			return false;
		}
	}
</script>
</head>
<body>
	<form:form commandName="orderModel"> <!-- enctype="multipart/form-data" class="form-control-static" -->
		<div
			style="width: 100%; background-color: #FFF; padding: 0px 20px 20px 20px;">
			<div id="ContentPanel"></div>
			<section class="content-wrapper main-content clear-fix">

				<div class="cgt-latest-wrap clearfix">
					<div
						style="margin: 1px auto; padding-top: 48px; clear: both; max-width: 1200px;">
						<div style="float: left; font-size: 20px; font-weight: bold;">
							<div style="box-sizing: border-box; font-size: 16px;">

								<span style="font-size: 18px; font-weight: normal;"> <img
									src="../template/image/order_basket/myticketLogo.png">
								</span>
							</div>
						</div>
						<div style="clear: both;"></div>
						<div style="height: 0px; margin-top: 24px;"></div>
					</div>

					<div class="clearfix"></div>

					<c:forEach items="${orderList}" var="order" varStatus="status">
						<!-- <s:url id="viewURL" action="scread">
							<s:param name="showboard_num">
								<s:property value="showboard_num" />
							</s:param>
						</s:url> -->
						<%-- 					<div class="cgt-latest cgt-list-ctype-1">
						<div class="cgt_latest_image_area">
							<a href="/showcase/scread.action?showboard_category=${show_resultClass.showboard_category}&showboard_num=${show_resultClass.showboard_num }">
								<img
								src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
								class="img-responsive" />
							</a>
						</div>
						<!-- img -->
						<div class="cgt_list_mask" style="width: 284px; height: 295px;"></div> --%>
						<div class="cgt-latest cgt-list-ctype-1">
							<div style="position: absolute; width: 100%; z-index: 100;">
								<div
									style="float: right; width: 40px; height: 40px; border-radius: 20px; color: #FFF; text-align: center; font-weight: bold; line-height: 40px; margin: 10px 10px 0px 0px;"></div>
								<div style="clear: both;"></div>
							</div>
							<a
								href='/showcase/scread.action?showcase_category=${showcaseModel.showcase_category}&showcase_num=<s:property value="showboard_num"/>'
								target="_blank"> <!-- <img src="https://www.cangoto.kr/Resource/Poster/po(58).jpg" class="img-responsive"> -->
								<img src="../showcaseImg/${order.file_savname.split(',')[0]}"
								class="img-responsive"
								onerror="javascript:this.src='/template/image/main/noimg.png'"></>
							</a>
							<!-- img -->

							<!-- over layer -->
							<div class="cgt_list_explanation">
								<!-- title -->
								<div class="subject">
									<a
										href="/order/view/${order.order_num}/${currentPage }">
										${order.show_subject } </a>
								</div>

								<!-- date -->
								<div class="schedule">
									<!-- <s:property value="date" /> -->
									<fmt:formatDate value="${order.start_date }" pattern="YY년 MM월 dd일" />
									-
									<fmt:formatDate value="${order.end_date }" pattern="YY년 MM월 dd일" />
								</div>


								<div class="place_price">
									<div class="place">
										<!-- <s:property value="address2" /> -->
										${order.show_addr }
									</div>
									<div
										style="width: 30px; height: 2px; background-color: #F470C9; margin: 20px 0px 10px 0px;"></div>
									<div class="price"><fmt:formatNumber value="${order.show_price }" type="number"/></div>
									<div class="price">
										<%-- <s:if test='%{order.order_status == "티켓 신청" }'>
									${order.order_status } 완료<br>
									</s:if>
									<s:else>
									${order.order_status } 완료<br>
									</s:else> --%>

										<c:set var="order_status" value="${order.order_status }" />
										<c:choose>
											<c:when test="${order.order_status eq '티켓 신청' }">
											${order.order_status } 완료 <br>
											</c:when>
											<c:when test="${order.order_status eq '티켓 만료' }">
											${order.order_status } <br>
											</c:when>
											<c:when test="${order.order_status eq '티켓 취소' }">
											${order.order_status } 완료 <br>
											</c:when>
										</c:choose>

									</div>
									<div style="width: 30px; margin: 10px 10px 10px 10px">
										<%-- <s:if test='%{order.order_status == "티켓 신청" }'>
										<img src="../barcodeImg/${order.barcode}.png"
											style="cursor: pointer;"
											onclick="doImgPop('../barcodeImg/${order.barcode}.png')"
											width="220" />
									</s:if>
									<s:else>
										<img src="../barcodeImg/default.png" width="220" />
									</s:else> --%>

										<c:set var="order_status" value="${order.order_status }" />
										<c:choose>
											<c:when test="${order.order_status eq '티켓 신청' }">
												<img src="../barcodeImg/${order.barcode}.png"
													style="cursor: pointer;"
													onclick="doImgPop('../barcodeImg/${order.barcode}.png')"
													width="220" />
											</c:when>
											<c:otherwise>
												<img src="../barcodeImg/default.png" width="220" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>

							</div>
							<!-- contents-->
							<!-- social -->
							<div class="cgt_list_count clearfix"
								style="font-size: 12px; color: #666;">
								<div style="float: left;">
									<c:set var="order_status" value="${order.order_status }" />
									<c:choose>
										<c:when test="${order_status eq '티켓 신청' }">
											<input type="button" name="status" value="취소" onclick="return deletecheck(${order.order_num});"
											class="btn btn-xs btn-default" />
										</c:when>
									</c:choose>
									<%-- <s:if test='%{status == "티켓 신청" }'>
										<input type="button" name="status" value="취소"
											onclick="return deletecheck(${order_num});"
											class="btn btn-xs btn-default">
									</s:if> --%>
								</div>
								<div>
									<div>
										<img src="/template/image/main/icon_apply.jpg"
											class="application_icon">
										${order.ordercount}
									</div>
									<!-- applie -->
									<div style="margin-right: 10px;">
										<img src="/template/image/main/icon_eye.jpg" class="view_icon">
										${order.readcount }
									</div>
									<!-- views -->
								</div>
							</div>
						</div>
					</c:forEach>
					<div
						style="margin: 1px auto; clear: both; max-width: 1200px; text-align: center;">
						<div style="font-size: 20px; font-weight: bold;">
							<div style="box-sizing: border-box; font-size: 16px;">
								<td colspan="7"><s:property value="pagingHtml"
										escape="false" /></td>
							</div>
						</div>
						<div style="clear: both;"></div>
						<div style="height: 0px; margin-top: 24px;"></div>
					</div>
			</section>
		</div>
	</form:form>
	<%-- <div class="container">
		<form name="orderList" method="post">

			<table width="600" class="table table_condensed table-hover">

				<tr valign="middle" class="active">
					<td align="center">사진</td>
					<td align="center">신청일자</td>
					<td align="center" colspan="2">티켓 정보</td>
					<td align="center">바코드</td>
					<td align="center" width="100">상태</td>
				</tr>


				<s:iterator value="orderList" status="stat">

					<tr height="80" valign="middle">
						<td align="center"><img
							src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
							width="50px" height="100px"
							onerror="javascript:this.src='/template/image/main/noimg.png'"></>
						</td>
						<td width="90" align="center"><fmt:formatDate
								value="${order_date }" pattern="yyyy-MM-dd HH:mm" /></td>
						<td colspan="2" align="center" height="80" width="220">
							<table>
								<tr height="23">
									<td width="100" align="right">전시명:</td>
									<td width="110" align="center"><b><a
											href="/order/orderView.action?order_num=${order_num}&currentPage=${currentPage }">
												${subject } </b></a></td>
								</tr>
								<tr height="23">
									<td width="100" align="right">전시일정:</td>
									<td width="110" align="center">${date }</td>
								</tr>
								<tr height="23">
									<td width="100" align="right">전시장소:</td>
									<td width="110" align="center">${address2 }</td>
								</tr>
							</table>
						</td>
						<s:if test='%{status == "티켓 신청" }'>
							<td width="100" height="30" align="center"><img
								src="../barcodeImg/${barcode}.png" style="cursor: pointer;"
								onclick="doImgPop('../barcodeImg/${barcode}.png')" width="150" /></td>
							<td align="center" width="100">${status }<br> <input
								type="button" name="status" value="취소하기"
								onclick="return deletecheck(${order_num});"
								class="btn btn-xs btn-success">
							</td>
						</s:if>
						<s:else>
							<td width="80" height="30" align="center">-</td>
							<td align="center" width="100">${status }</td>
						</s:else>
					</tr>

				</s:iterator>

				<s:if test="orderList.size() == 0">
					<tr>
						<td colspan="6" align="center"><font size="2"> 신청하신
								전시회가 없습니다.</font></td>
					</tr>
				</s:if>
			</table>
			<table width="600" algin="center" class="table table_condensed">
				<tr>
					<td colspan="6" align="center"><s:property value="pagingHtml"
							escape="false" /></td>
				</tr>

			</table>

		</form>
	</div> --%>
	</section>
	</div>
</body>
</html>