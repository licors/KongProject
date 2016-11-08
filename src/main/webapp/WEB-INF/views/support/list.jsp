<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="userDetail" property="principal" />
<div style="width:100%; background-color:#FFF;">
    <div id="ContentPanel"></div>
    <section class="cgt-content-wrapper main-content clear-fix">

        <div class="cgt_support" style="padding-top:50px; max-width:1200px; margin:0px auto;">
            <div style="max-width:1200px; text-align:left; margin:0px auto 40px auto;">
                <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 10px 0px; padding:0px;">나의 문의내역</p>
                <h2 class="noticefontsubtitle">문의사항을 남겨주시면 친절하게 답변해 드립니다.</h2>
            </div>
            <div style="max-width:1200px; text-align:left; margin:40px auto 0px auto;">
                <div class="Reg_Support_Nav">
                    <div class="boxes">
                        <div class="box box1"><a class="txtselected" href="/support/write/${userDetail.member_num}">회원문의</a></div>
                        <div class="selected box2"><a href="/support/list/${userDetail.member_num}">나의 문의내역</a></div>
                        <div class="box box3">&nbsp;</div>
                    </div>
                </div>
            </div>
            <div style="width:100%; text-align:center;font-weight:bold;border-bottom:2px solid #d1d1d1;" class="clearfix">
                <div style="float: left; width: 5%; padding: 20px 0px;">번호</div>
                <div style="float: left; width: 23%; padding: 20px 0px;">유형</div>
                <div style="float: left; width: 62%; padding: 20px 0px;">내용</div>
                <div style="float: left; width: 10%; padding: 20px 0px;">작성일</div>
            </div>
            <c:forEach var="list" items="${list}" varStatus="stat">
                <a href="/support/view/${list.support_num}" class="btn_cgt_notice_detail cgt-single-load">
                    <div style="width: 100%; text-align: center; border-bottom: 1px solid #d1d1d1;" class="clearfix">
                        <div style="float: left; width: 5%; padding: 20px 0px;">${list.support_num}</div>
                        <div style="float: left; width: 23%; padding: 20px 0px;"><c:if test="${list.re_level ne 0}"><c:forEach var = "i" begin = "${list.re_level}" end = "0">&nbsp;</c:forEach>→</c:if>${list.type}</div>
                        <div style="float: left; width: 62%; padding: 20px 0px;text-align:left;"><c:choose><c:when test="${fn:length(list.content) > 50}"><c:out value="${fn:substring(list.content,0,49)}"/>...</c:when><c:otherwise><c:out value="${list.content}"/></c:otherwise></c:choose></div>
                        <div style="float: left; width: 10%; padding: 20px 0px;"><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd"/></div>
                    </div>
                </a>
            </c:forEach>
            <!-- <a href="Url.Action( "SupportDetail" , "Help" , new { bid = item.BID , search_type = ViewBag.SEARCH_TYPE , search_text = ViewBag.SEARCH_TEXT } )" class="btn_cgt_notice_detail cgt-single-load">-->
            <div style="padding-bottom:50px;"></div>
            <script>
                document.querySelector('.sweet').onclick = function () {
                    swal({
                        title: "고객님의 1:1문의 접수가 완료 되었습니다.",
                        text: "문의하신 내용에 대한 답변은 문의내역\, 이메일에서\n확인 가능합니다.",
                        //type: "info",

                        confirmButtonClass: 'btn-info btn-block',
                        confirmButtonText: '확인'
                    });
                };
            </script>
        </div>

    </section>
</div>
