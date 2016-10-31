<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K O N G</title>
<script>
	function deletecheck() {
		if (confirm("삭제하시겠습니까?")) {
		} else {
			alert("취소되었습니다");
			
			
		}
	}
</script>
<!-- show_status 0은 예정 1은 행사중, -1은 삭제된 것 구현 필요-->
</head>
<body>

	<div
		style="width: 100%; background-color: #FFF; padding: 0px 20px 20px 20px;">
		<div id="ContentPanel"></div>
		<section class="content-wrapper main-content clear-fix">

		<div class="cgt-latest-wrap clearfix">
			<div
				style="margin: 1px auto; padding-top: 48px; clear: both; max-width: 1200px;">
				<div style="float: left; font-size: 20px; font-weight: bold;">
					<div style="box-sizing: border-box; font-size: 16px;">
						<span style="font-size: 18px; font-weight: normal;">
						<img src="../template/image/order_basket/interestLogo.png">
						</span>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="height: 0px; margin-top: 24px;"></div>
			</div>
			<div style="margin: 1px auto; clear: both; max-width: 1200px;">
				<div style="float: right; font-size: 20px; font-weight: bold;">
					<div style="box-sizing: border-box; font-size: 16px;">
					<c:choose>
						<c:when test="${list.size() eq 0 }">
							<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/main'"
								class="btn btn-sm btn-default">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="total_price" value="${total_price}" />
							<input type="button" name="orderB" value="전체 신청"
								onClick="location.href='/order/form_B'"
								class="btn btn-sm btn-success">				
							<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/main'"
								class="btn btn-sm btn-default">
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="height: 0px; margin-top: 24px;"></div>
			</div>
			<div class="clearfix"></div>

			<c:forEach var="list" items="${list}">
				<c:url var="viewURL" value="/order/view">
					<c:param name="showboard_num" value="${list.showboard_num }">
						
					</c:param>
				</c:url>
<%--  				<div class="cgt-latest cgt-list-ctype-1">
					<div class="cgt_latest_image_area">
						<a
							href="/showcase/scread.action?showboard_category=<s:property value="showboard_category" />&showboard_num=<s:property value="showboard_num" />">
							<img
							src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
							class="img-responsive"/>
						</a>
					</div>
					<!-- img -->
					
					<div class="cgt_list_mask" style="width: 284px; height: 295px;"></div> --%>
					            <div class="cgt-latest cgt-list-ctype-1">
                <div style="position:absolute; width:100%; z-index:100;">
                    <div style="float:right; width:40px; height:40px; border-radius:20px;  color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;"></div>
                    <div style="clear:both;"></div>
                </div>
                <a href ='/showcase/view?showboard_category=${list.showboard_category }&showboard_num=${list.showboard_num }'target="_blank">
                    <!-- <img src="https://www.cangoto.kr/Resource/Poster/po(58).jpg" class="img-responsive"> -->
                    <img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>" class="img-responsive"
                        onerror="javascript:this.src='/template/image/main/noimg.png'"></></a>
                <!-- img -->

					<!-- over layer -->
					<div class="cgt_list_explanation">
						<!-- title -->
						<div class="subject">
							<a
								href="/showcase/view?showboard_category=${list.showboard_category }&showboard_num=${list.showboard_num }">
								${list.subject }
							</a>
						</div>

						<!-- date -->
						<div class="schedule">
							${list.date }
						</div>


						<div class="place_price">
							<div class="place">
								${list.address2 }
							</div>
							<div
								style="width: 30px; height: 2px; background-color: #F470C9; margin: 20px 0px 10px 0px;"></div>
							<!-- <div class="price">무료</div> -->
							<div class="price">
							<c:choose>
								<c:when test="${list.price eq 0 }">무료
								</c:when>
								<c:otherwise>
									${list.price }원
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
							<input type="button" name="order" value="신청"
								onClick="location.href='/order/check?showboard_num=${list.showboard_num }'"
								class="btn btn-xs btn-success"> <input type="button"
								name="deleteB" value="삭제"
								onClick="location.href='/basket/deleteBasket?basket_num=${list.basket_num}'"
								class="btn btn-xs btn-default">
						</div>
						<div>
							<div>
								<img src="/template/image/main/icon_apply.jpg"
									class="application_icon">
								${list.ordercount }
							</div>
							<!-- applie -->
							<div style="margin-right: 10px;">
								<img src="/template/image/main/icon_eye.jpg" class="view_icon">
								${list.readcount }
								
							</div>
							<!-- views -->
						</div>
					</div>
				</div>
			</c:forEach>

			<div style="margin: 1px auto; clear: both; max-width: 1200px; text-align:center;">
				<div style="font-size: 20px; font-weight: bold;">
					<div style="box-sizing: border-box; font-size: 16px;">
						<td colspan="7" align="center">${pagingHtml }</td>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="height: 0px; margin-top: 24px;"></div>
			</div>
		</section>
	</div>

	<%--원래 장바구니
 <div class="container">
	<form name="basketList" method="post">
		<table width="600" align="center" class="table table_condensed table-hover">
			<tr>
				<tr align="center" class="active">
				<td align="center">사진</td>
				<td align="center">전시명</td>
				<td align="center">전시기간</td>
				<td align="center">장소</td>
				<td align="center">취소 </td>
				</tr>

				<s:iterator value="basketList" status="stat">
					<tr>		<!-- img 수정 -->							
						<td width="80" align="center">
						<img src="../showcaseImg/<s:property value="file_savname.split(',')[0]"/>"
				width="100px" height="150px" onerror="javascript:this.src='/template/image/main/noimg.png'"></>
						</td>
						<td width="300" align="center">${subject}</td>
						<td width="80"align="center">${date}</td>
						<td width="80"align="center">${address2}</td>
						<td width="80" align="center">
							<input type="button" name="deleteB" value="삭제" 
							onClick="location.href='/basket/deleteBasket.action?basket_num=<s:property value="basket_num"/>'" class="btn btn-xs btn-danger">
						</td>
					</tr> 

				</s:iterator>
					<s:if test="basketList.size() == 0">
						<tr>
							<td colspan="7" align="center"><font size="2">장바구니에
									담긴 상품이 없습니다.</font></td>
						</tr>
						<tr height="40">
							<td align="right" colspan="6">
								<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'" class="btn btn-xs btn-default">
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr height="40">
							<td align="right" colspan="6">
								<input type="button" name="orderB" value="주문하기"
								onClick="location.href='/order/order_checkB.action'" class="btn btn-xs btn-success">
								<input type="button" name="list" value="메인으로"
								onClick="location.href='/showcase/sclist.action'" class="btn btn-xs btn-default">
							</td>						
						</tr>
					</s:else>
					<tr>
						<td colspan="7" align="center"><s:property value="pagingHtml" escape="false"/></td>
					</tr>
			</table>
		</form>
		</div> --%>
</body>
</html>