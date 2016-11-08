<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="userDetail" property="principal" />
<div style="width:100%; background-color:#FFF;">
    <div id="ContentPanel"></div>
    <section class="cgt-content-wrapper main-content clear-fix">

        <div style="padding-top:50px;">
            <div style="max-width:1200px; text-align:left; margin:0px auto 40px auto;">
                <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 10px 0px; padding:0px;">1:1 문의</p>
                <h2 class="noticefontsubtitle">문의사항을 남겨주시면 친절하게 답변해 드립니다.</h2>
            </div>
            <div style="max-width:1200px; text-align:left; margin:0px auto 40px auto;">
                <div class="Reg_Support_Nav">
                    <div class="boxes">
                        <div class="selected box1"><a href="/support/write/${userDetail.member_num}">회원문의</a></div>
                        <div class="box box2"><a href="/support/list/${userDetail.member_num}">나의 문의내역</a></div>
                        <div class="box box3">&nbsp;</div>
                    </div>
                </div>
            </div>
            <form action="/support/write/${userDetail.member_num}" class="form-horizontal" method="post" role="form">        
                <div style="max-width:1200px; margin:0px auto; padding-bottom:0px; border-bottom:1px solid #CCCCCC;">
                    <div class="container user_info">
                        <div class="clearfix">
                            <div class="col-md-12" style="margin-bottom:10px;">* 이메일 주소는 문의내용 확인 및 회신을 위한 용도로만 사용됩니다.</div>
                        </div>
                        <hr style="margin:40px 0px;">
                        <div class="clearfix" style="padding-bottom:10px;">
                            <div class="col-md-2">무엇이 궁금하세요</div>
                            <div class="col-md-10">
                                <select class="form-control input-lg" name="type" id="QUESTION_TYPE" style="width:40%">
                                    <option value="">무엇이 궁금하세요</option>
                                    <option value="전시/행사/공연 제보">전시/행사/공연 제보</option>
                                    <option value="제휴문의">제휴문의</option>
                                    <option value="앱 사용/오류 문의">앱 사용/오류 문의</option>
                                    <option value="결제 및 환불 문의">결제 및 환불 문의</option>
                                    <option value="기타문의">기타문의</option>
                                    <option value="전시회(부스)참가문의">전시회(부스)참가문의</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix" style="padding-bottom:10px;">
                            <div class="col-md-2">이메일</div>
                            <div class="col-md-10"><input type="text" id="EMAIL" name="email" class="form-control search_box_input" placeholder="이메일" style="font-size:18px;width:40%;" value="${userDetail.id_email}"></div>
                        </div>
                        <div class="clearfix" style="margin-bottom:40px;">
                            <div class="col-md-2">문의내용</div>
                            <div class="col-md-10"><textarea class="form-control input-lg" cols="20" id="QUESTION" name="content" placeholder="문의사항을 남겨주시면 친절하게 답변해 드립니다." rows="5" style="width:100%"></textarea></div>
                        </div>

                    </div>
                </div>
                <div style="max-width:1200px; text-align:center; margin:20px auto 40px auto;">
                    <button type="submit" name="RegMySupport" id="RegMySupport" class="btn btn-light-blue" style="display:inline-block; width:80px;" onclick="return fnValidation();">보내기</button>
                </div>
            </form></div>
        <script>
            function fnValidation() {

                var flag = true;
                var msg = '';

                if (jQuery('#QUESTION_TYPE').children('option:selected').val() == '' || jQuery('#QUESTION_TYPE').children('option:selected').size() == 0) {
                    msg += '- 무엇이 궁금하신가요?\n';
                    flag = false;
                }
                if (jQuery('#EMAIL').val() == '') {
                    msg += '- 이메일\n';
                    flag = false;
                }
                if (jQuery('#QUESTION').val() == '') {
                    msg += '- 문의내용\n';
                    flag = false;
                }

                if (flag) {
                    return true;
                } else {
                    alert('아래 내용을 입력하여 주십시오\n\n' + msg);
                    return false;
                }
            }
        </script>
    </section>
</div>
