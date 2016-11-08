<%@page contentType="text/html" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script
	src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 메인 드랍다운용 -->
<!--<div id="pjax-container">

    <meta property="og:url" content="https://www.cangoto.kr/Event/1/4005/아이니-웨딩x혼수초대전11월">
    <meta property="og:title" content="아이니 웨딩x혼수초대전(11월)">  (필수) 
    <meta property="og:image" content="https://www.cangoto.kr/Resource/Poster/po(256).jpg">  (필수) 
    <meta property="og:description" content="무료">  (필수) 
    <meta property="product:price:currency" content="KRW">  (필수) 
    <meta property="product:price:amount">  (필수) 

    <div id="cgt_modal_event_detail" class="modal latest in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="background: transparent; display: block;">
-->
<div class="modal-dialog cgt_modal">
	<!-- Detail -->
	<div class="cgt_detail_body">
		<div class="cgt_detail_wrap">
			<div style="clear: both; padding-left: 40px;">
				<!--<div class="pull-right" style="width: 68px; height: 68px; padding-top:20px; cursor:pointer; " id="btnClose"><img src="/Content/img/detail_close.jpg" style="display: block; margin: 0 auto; box-sizing: border-box"></div>-->
				<div class="pull-left"
					style="padding-top: 19px; box-sizing: border-box">
					<div style="font-size: 2.5em; padding-top: 5px; color: black;">${view.subject}&nbsp;</div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div class="col-xs-5"
					style="padding-left: 40px !important; padding-top: 15px !important;">
					<a href="${img}${view.file_savname.split(',')[0]}" class="fancybox"><img
						src="${img}${view.file_savname.split(',')[0]}"
						style="width: 312px; height: 381px; border: 1px solid #DEDEDE"></a>
				</div>
				<div class="col-xs-7">
					<div class="cgt_detail_contents">
						<div class="col-xs-12 padding-left-clear">
							<div class="col-md-2 bold padding-left-clear">장소</div>
							<div class="col-md-10 info-place">${view.address1}&nbsp;${view.address2}&nbsp;<!--<div style="float:right;"><a href="#" onclick="jQuery('a[data-target=#map]').click();return false;"><img src="/resources/image/main/btn_map.jpg" width="25" height="25"></a></div>-->
							</div>
							<div class="clearfix"></div>
							<div class="cgt_line_gray_1 cgt_mtb_10"></div>
							<div class="col-md-2 bold padding-left-clear">일정</div>
							<div class="col-md-10">
								<div class="pull-left">
									<fmt:formatDate value="${view.start_date}" pattern="yyyy-MM-dd" />
									~
									<fmt:formatDate value="${view.end_date}" pattern="yyyy-MM-dd" />
									<fmt:parseNumber
										value="${view.start_date.time / (1000*60*60*24)}"
										integerOnly="true" var="start" />
									<fmt:parseNumber
										value="${view.end_date.time / (1000*60*60*24)}"
										integerOnly="true" var="end" />
									/ ${(end - start) + 1}일간&nbsp;
								</div>
								<div class="pull-right" style="color: red;">개최중</div>
							</div>
							<div class="clearfix"></div>
							<div class="cgt_line_gray_1 cgt_mtb_10"></div>
							<div class="col-md-2 bold padding-left-clear">입장료</div>
							<div class="col-md-10">
								<c:choose>
									<c:when test="${view.price eq 0}">무료</c:when>
									<c:when test="${view.price ne 0}">${view.price}원</c:when>
								</c:choose>
								&nbsp;
							</div>
							<div class="clearfix"></div>
							<div class="cgt_line_gray_1 cgt_mtb_10"></div>
							<div class="col-md-2 bold padding-left-clear">문의전화</div>
							<div class="col-md-10">${view.tel}&nbsp;</div>
							<div class="clearfix"></div>
							<div class="cgt_line_gray_1 cgt_mtb_10"></div>
							<div class="col-md-2 bold padding-left-clear">태그</div>
							<div class="col-md-10">
								<c:if test="${!empty view.tag}">
									<c:set var="tags" value="${fn:split(view.tag, ',')}" />
									<c:forEach var="silceTags" items="${tags}" varStatus="stat">
										<a href="/main/search/Tag/${silceTags}" target="_blank"><div
												class="cgt_detail_tag">${silceTags}</div></a>&nbsp;
                                        </c:forEach>
								</c:if>
							</div>
							<div class="clearfix"></div>
							<div class="cgt_line_gray_1 cgt_mtb_10"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div style="width: 100%; box-sizing: border-box; padding: 0 40px">
				<div class="cgt_line_gray_1 cgt_mtb_20"></div>
				<c:choose>
					<c:when test="${empty member}">
						<!-- 로그인 안함 -->
						<div class="pull-right">
							<a href="#"
								onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까?' , '/member/login' );"><div
									class="cgt_btn_detail_application">신청하기</div></a>
						</div>
						<div class="pull-right">
							<a href="#"
								onclick="return fnConfirmMoveUrl('로그인을 하셔야 이용하실수 있습니다.\n로그인 페이지로 이동하시겠습니까?' , '/member/login' );"><div
									class="cgt_btn_detail_favorite">관심티켓</div></a>
						</div>
					</c:when>
					<c:when test="${!empty member}">
						<!-- 로그인 함 -->
						<div class="pull-right">
							<a href="/order/check/${view.showcase_num}"><div
									class="cgt_btn_detail_application">신청하기</div></a>
						</div>
						<div class="pull-right">
							<a href="/basket/add/${view.showcase_num}"><div
									class="cgt_btn_detail_favorite">관심티켓</div></a>
						</div>
					</c:when>
				</c:choose>
			</div>
			<div class="clearfix"></div>
			<div style="padding: 25px;"></div>
			<div class="tab_container">
				<a data-target="#info" data-toggle="tab">
					<div class="pull-left cgt_detail_tab">상세정보</div>
				</a> <a data-target="#caution" data-toggle="tab">
					<div class="pull-left cgt_detail_tab">구매 및 환불안내</div>
				</a> <a data-target="#map" data-toggle="tab" id="mapsel">
					<div class="pull-left cgt_detail_tab">오시는길</div>
				</a> <a data-target="#together" data-toggle="tab">
					<div class="pull-left cgt_detail_tab">댓글</div>
				</a>
			</div>
			<script type="text/javascript">
				$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
					$('a[data-toggle="tab"]').children().removeClass('active');
					jQuery(e.target).children().addClass('active');
				});
			</script>
			<div class="clearfix"></div>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="info">
					<div
						style="width: 100%; box-sizing: border-box; padding: 10px 40px 0px 40px;">
						<!-- 소개 -->
						<div itemprop="articleBody">${view.content}</div>
						<c:if test="${view.file_savname.split(',')[1] ne null}">
							<div style="padding-top: 20px">
								<a href="javascript:" id="divBtnMore">
									<div
										style="border: 1px solid #DEDEDE; line-height: 44px; width: 100%; border-radius: 3px; text-align: center; margin-top: 20px; cursor: pointer">
										<div id="spItemMore">+ 더보기</div>
									</div>
								</a>
								<div style="padding-top: 20px">
									<div style="display: none;" id="divItems">
										<c:set var="img_paths"
											value="${fn:split(view.file_savname, ',')}" />
										<c:forEach var="file" items="${img_paths}" varStatus="stat">
											<c:if test="${stat.index ne 0}">
												<div style="text-align: center;">
													<img src="${img}${file}" style="height: auto; width: 320px">
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:if>
						<!-- 소개 -->
						<div class="cgt_line_black_3 cgt_mtb_40"></div>
					</div>
				</div>
				<!-- 환불 & 주의사항 -->
				<div class="tab-pane fade" id="caution">
					<div
						style="width: 100%; box-sizing: border-box; padding: 10px 40px 40px 40px;">
						<!--<span style="color:#0000FF"><strong>* 캔고루 가격 → </strong></span><span style="color:#FF0000"><strong>무료</strong></span><br><br><strong>* 시간</strong><br>오전 11시 ~ 오후 8시-->
						<img src="/resources/image/main/tit_faq.png">
						<div class="container"
							style="padding-left: 0px; padding-right: 0px;">
							<!-- 아코디언 영역 -->
							<div class="panel-group" id="accordion">
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ8">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">입장은 어떻게 하나요?</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ8" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												티켓을 다운받으면 바코드 티켓을 발급해 드립니다.<br>입장 시, 티켓 받으신 분의 성함/핸드폰
												번호를 확인하고 입장 가능합니다.<br>
											</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ7">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">티켓 양도가 가능한가요?</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ7" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">티켓 양도 가능 하며, 현장에서
												대리자가 티켓 다운하신 분의 성함, 핸드폰 번호로 확인 받으실 수 있습니다.</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ6">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">추가 인원과 함께 가고 싶어요</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ6" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												<p>
													통상적으로 1인 1매가 원칙이며, 초대권이 지급되는 행사는 초대권 등록 후, 추가 인원 사용가능 하십니다.<br>초대권을
													등록하지 않은 경우에는 사용 불가하며,&nbsp;초대권이 없는 행사도 있으니 참고하시기 바랍니다.
												</p>
											</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ5">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">전시회 재입장이 가능한가요?</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ5" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												<p>
													일반적인 경우, 전시회는 1매의 티켓을 구입하여 하루만 입장이 가능하며, 일부 전시의 경우에
													네임택(입장목걸이)을&nbsp;퇴장시 제출하지 않으면 다음날 소지하고 입장이 되는 경우가 있기도 합니다.
													하지만 네임택에 날짜를 기입하는 전시회의 경우는 이러한 방식도 적용되지 않습니다.<br>
													<br>자세한 안내는 행사페이지 관련문의에 기입된 번호로 문의바랍니다.
												</p>
											</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ4">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">다운받은 티켓은 어디서 확인하나요?</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ4" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												<p>우측 상단 마이페이지&nbsp;&gt; 마이티켓에서 확인할 수 있습니다.</p>
											</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ3">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">관심티켓 설정은 어떻게 하나요?</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ3" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												<p>
													관심티켓은 일종의 즐겨찾기와 같습니다.<br>관심 있는 행사의 상세보기에서 관심티켓 버튼을
													눌러주세요.<br>우측 상단 마이페이지&nbsp;&gt; 관심티켓에서 확인할 수 있습니다.
												</p>
											</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ2">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">유료티켓을 구매하고 싶어요.</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ2" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												<p>현재 캔고루 웹에서는 유료티켓 구매가 되지 않습니다.</p>

												<p>캔고루 앱에서만 유료 티켓 구매가 가능하오니, 불편하시더라도 앱 내 결제를 부탁 드립니다.</p>
											</h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default faqwrapper"
									style="border-top: 0px solid #DDD; border-left: 0px solid #FFF; border-right: 0px solid #FFF; box-shadow: none; margin: 0px">
									<a class="accordion-toggle faqfontqtitle"
										data-toggle="collapse" data-parent="#accordion" href="#FAQ1">
										<div class="panel-heading"
											style="background-color: #FFF; border-bottom: 0px solid #FFF;">
											<h4 class="panel-title">
												<!-- href="#FAQ1" 부분 (1 = Count) 이 부분이 -->
												<span class="col-xs-1">Q.</span>
												<!-- 위 Count 값을 넣어 주심 될듯 합니다~ -->
												<span class="col-xs-11">환불은 어떻게 하나요?</span>
											</h4>
											<div class="clearfix"></div>
										</div>
									</a>
									<div id="FAQ1" class="panel-collapse collapse"
										style="background-color: #F9F9F9; border-top: 1px solid #DDDDDD;">
										<!-- 이부분 ID 와 일치되게 -->
										<div class="panel-body">
											<h4 class="col-xs-1 asked-A">A.</h4>
											<h4 class="col-xs-11 faqfontqanswer">
												방법 세 가지 중 한가지로 연락 주시면 취소처리됩니다.<br>
												<br>1.환불 원하는 티켓을 FAQ 1:1문의에 행사명과 함께 기입 (다음 영업일에 답변 및
												처리)<br>2.카카오톡 ‘캔고루’(다음 영업일에 답변 및 처리) 로 환불 원하는 티켓명과 성함,
												핸드폰번호 보내기<br>3.캔고루 고객센터 ’02-868-4184’(평일 오전9시~오후6시)<br>
												<br>-단, 행사의 환불기간이 종료된 경우 불가능<br>-취소처리 후 완료 문자 발송<br>
											</h4>
										</div>
									</div>
								</div>
							</div>
							<!--// 아코디언 영역 -->
							<div class="clearfix" style="padding-bottom: 50px;"></div>
						</div>
					</div>
				</div>
				<!-- 환불 & 주의사항 -->
				<!-- 오시는길 -->
				<div class="tab-pane fade" id="map">
					<div
						style="width: 100%; box-sizing: border-box; padding: 10px 40px 40px 40px;">
						<div style="margin: 20px 0px; z-index: 99999;">
							<div id="map-canvas" style="width: 100%; height: 300px;"></div>
							<div id="map-canvas-none"
								style="display: none; color: black; font-size: 20px;">등록된
								지도 정보가 없습니다.</div>
						</div>
						<div class="evtdetailadd">
							<div class="boxes">
								<div class="box box1">
									<div style="font-weight: bold;">주소</div>
									<span id="map-input">${view.address1}&nbsp;${view.address2}</span>
								</div>
								<div class="box box2">
									<div style="font-weight: bold;">문의전화</div>
									<div>${view.tel}</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- 오시는길 -->

				<!-- 같이가요 -->
				<div class="tab-pane fade" id="together">
					<div
						style="width: 100%; box-sizing: border-box; padding: 10px 40px 40px 40px;">
						<sec:authorize access="isAnonymous()">
							<div>
								<div class="center">
									<u><a href="/member/login"
										style="text-decoration: underline; color: blue; font-weight: bold;">로그인</a></u>
									하셔야 이용하실 수 있습니다.
								</div>
							</div>
						</sec:authorize>


						<sec:authorize access="hasRole('ROLE_USER')">
							<div>
								<div style="margin-bottom: 5px;">
									<textarea id="txtCONTENT" rows="5"
										class="form-control search_box_input"
										placeholder="게시물 성격에 맞지 않거나 비방 댓글은 통보없이 삭제 됩니다."></textarea>
								</div>
								<div style="text-align: right;">
									<button class="btn btn-light-blue"
										onclick="fnRegReply(null, null, jQuery('#txtCONTENT').val());">댓글등록</button>
								</div>
							</div>
						</sec:authorize>

						<div
							style="margin-top: 20px; margin-bottom: 20px; padding-top: 20px; border-top: 3px solid #000;"></div>
						<c:choose>
							<c:when test="${empty list }">
								<div id="divReply">
									<div>등록된 글이 없습니다.</div>
								</div>
							</c:when>
							<c:when test="${!empty list }">
								<c:forEach var="comment" items="list">






									<div class="evtdetailitems">
										<div>
											<div style="float: left; font-size: 12px;">
												<span style="display: inline-block;">전*민</span> <span
													style="display: inline-block; margin-right: 10px;">
													| 2016-10-24</span>
											</div>
											<!-- 작성자, 작성일, 좋아요btn, 댓글btn -->
											<div style="float: right; font-size: 12px;">
												<div
													style="display: inline-block; cursor: pointer; margin-right: 10px;">
													<a onclick="fnLikeReply(54343);">♥ 좋아요</a>
												</div>
												<div style="display: inline-block; cursor: pointer">
													<a onclick="jQuery('#reReply_54343').toggle();">■ 댓글달기</a>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
										<div>
											<div id="divViewCONTENT_54343">
												<div
													style="float: left; max-width: 730px; font-weight: bold; line-height: 1.5; font-size: 12px;"
													id="divCONTENT_54343">완전 기대됩니다!!!</div>
												<div style="float: right; font-size: 12px;">
													<span style="display: inline-block;">좋아요 <span
														id="spanLikeCnt_54343">0</span>개
													</span>
												</div>
											</div>
											<div id="divEditCONTENT_54343" style="display: none;">
												<textarea id="txtcontent_" style="max-width: 100%;"
													rows=" 5" class="form-control search_box_input">완전 기대됩니다!!!</textarea>
												<div
													style="font-size: 12px; margin-top: 4px; text-align: right">
													<button class="btn btn-light-grey"
														onclick="fnRegReReply(54343 , 'M' , 'R'  , jQuery( '#txtcontent_' ).val());">입력</button>
													&nbsp;&nbsp;
													<button class="btn btn-light-grey"
														onclick="fnModView(54343 , 'V' );">취소</button>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="evtdetailreplyinput" id="reReply_54343"
											style="display: none;">
											<div class="boxes">
												<div class="box box1">
													<input type="text" class="form-control search_box_input"
														placeholder="댓글입력" id="txtreReply_54343">
												</div>
												<!-- input box -->
												<div class="box box2">
													<button class="btn btn-light-grey"
														onclick="fnRegReply( 54343 , 'R' , jQuery( '#txtreReply_54343' ).val()   );">입력</button>
												</div>
												<!-- btn -->
											</div>
										</div>
										<div style="border-top: 1px dotted #a1a1a1; margin: 10px 0"></div>
									</div>







								</c:forEach>
							</c:when>
						</c:choose>
						<!-- 덧글 여부 if문 추가 -->
					</div>
				</div>
				<!-- 같이가요 -->
			</div>
			<div class="clearfix"></div>
			<div style="height: 20px;"></div>
			<div>
				<div class="detailAdvContainer" style="padding: 30px 40px;"></div>
			</div>
		</div>
		<!-- Detail -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!--<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.css">-->

<script type="text/javascript">
	function setLocation(x, y) {
		map_x = x;
		map_y = y;
	}
	function initialize() {
		var cairo = {
			lat : map_x,
			lng : map_y
		};
		var geocoder = new google.maps.Geocoder();

		if (cairo == null || cairo == '') {
			jQuery('#map-canvas').hide();
			jQuery('#map-canvas-none').show();
		}

		var mapOptions = {
			zoom : 16,
			scaleControl : true,
			scrollwheel : true,
			draggable : true,
			center : cairo
		};

		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);

		var infowindow = new google.maps.InfoWindow;
		infowindow.setContent('<b>' + contents + '</b>');

		var marker = new google.maps.Marker({
			map : map,
			position : cairo
		});
		marker.addListener('click', function() {
			infowindow.open(map, marker);
		});
	}

	function geocode(map, content) {
		if (map == null || !map) {
			return false;
		}
		contents = content;
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : map,
			'partialmatch' : true
		}, geocodeResult);
	}

	function geocodeResult(results, status) {
		if (status == 'OK' && results.length > 0) {
			setLocation(results[0].geometry.location.lat(),
					results[0].geometry.location.lng());
			initialize();
		}
	}
</script>
<script type="text/javascript">
	jQuery().ready(function() {
		map();
		fnInitControl();

	});
	function map() {
		jQuery('#mapsel').click(function() {
			geocode('${view.map}', '${view.subject}');
		});
	}

	function fnInitControl() {
		jQuery('#divBtnMore').click(function() {
			if (jQuery('#divItems').css('display') == 'none') {
				jQuery("#divItems").show();
				jQuery('#spItemMore').html('- 더보기');
			} else {
				jQuery("#divItems").hide();
				jQuery('#spItemMore').html('+ 더보기');
			}
		});
	}
</script>

<!--    </div>
</div>-->
