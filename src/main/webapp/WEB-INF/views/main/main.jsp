<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div style="width:100%; background-color:#FFF; padding:0px 20px 20px 20px;">
    <div id="ContentPanel"></div>
    <section class="content-wrapper main-content clear-fix">
        <div class="cgt-latest-wrap clearfix">
            <div style="margin:1px auto;padding-top: 48px; clear: both; max-width: 1200px; ">
                <div style="float:left;font-size:20px;font-weight:bold;">
                    <div style="box-sizing: border-box; font-size:16px;">
                        <span style="font-size:18px; font-weight:normal;"><img src="/resources/image/main/title_main_display.jpg"></span>
                    </div>
                </div>
                <div style="float:right;">
                    <div class="boxes">
                        <div class="box box1" style="cursor:pointer;">
                            <a href="/main/aticle"><img src="/resources/image/main/more.jpg" style="margin-top:7px;"></a>
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div style="height:0px;margin-top:24px;"></div>
            </div>
            <div class="clearfix"></div>
            <!-- ############################## list1(aticle) ############################## -->
            <c:forEach var="list" items="${aticle}" varStatus="stat">
                <div class="cgt-latest cgt-list-ctype-1">
                    <div style="position:absolute; width:100%; z-index:100;">
                        <div style="float:right; width:40px; height:40px; border-radius:20px; background-color:#EB009F; color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;">개최중</div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="cgt_latest_image_area">
                        <a href ='/main/view/${list.showcase_num}' target="_blank">
                            <c:set var="file" value="${fn:split(list.file_savname, ',')}" />
                            <img src="${img}${file[0]}" class="img-responsive">
                        </a>
                    </div><!-- img -->
                    <div class="cgt_list_mask" style="width: 284px; height: 295px;"></div>
                    <div class="cgt_list_button">
                        <a class="btn-detail cgt-single-load" href="/main/view/${list.showcase_num}"><img alt="상세보기" src="/resources/image/main/view_small_btn.png"></a>
                        <a class="btn-application cgt-single-load" href="/order/check/${list.showcase_num}"><img alt="신청하기" src="/resources/image/main/application_small_btn.png"></a>
                    </div>
                    <!-- over layer -->
                    <div class="cgt_list_explanation">
                        <div class="subject">${list.subject}</div>
                        <div class="schedule">
                            <fmt:formatDate value="${list.start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.end_date}" pattern="yyyy-MM-dd"/>
                            <fmt:parseNumber value="${ list.start_date.time / (1000*60*60*24) }" integerOnly="true" var="start"/>
                            <fmt:parseNumber value="${ list.end_date.time / (1000*60*60*24) }" integerOnly="true" var="end"/> / ${(end - start) + 1}일간
                        </div>
                        <div class="place_price">
                            <div class="place">${list.address2}</div>
                            <div style="width:30px; height:2px; background-color:#F470C9; margin:20px 0px 10px 0px;"></div>
                            <div class="price">
                                <c:choose>
                                    <c:when test="${list.price eq 0}">
                                        무료
                                    </c:when>
                                    <c:when test="${list.price ne 0}">
                                        ${list.price}원
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div><!-- contents-->
                    <!-- social -->
                    <div class="cgt_list_count clearfix" style="font-size: 12px; color: #666;">
                        <div><img src="/resources/image/main/icon_apply.jpg" class="application_icon"> ${list.ordercount}</div>
                        <div style="margin-right:10px;"><img src="/resources/image/main/icon_eye.jpg" class="view_icon"> ${list.readcount}</div>
                    </div>
                </div>
            </c:forEach>
            <!-- ############################## list2(art) ############################## -->
            <div style="margin:1px auto;padding-top: 48px; clear: both; max-width: 1200px; ">
                <div style="float:left;font-size:20px;font-weight:bold;">
                    <div style="box-sizing: border-box; font-size:16px;">
                        <span style="font-size:18px; font-weight:normal;"><img src="/resources/image/main/title_main_art.jpg"></span>
                    </div>
                </div>
                <div style="float:right;">
                    <div class="boxes">
                        <div class="box box1" style="cursor:pointer;">
                            <a href="/main/art"><img src="/resources/image/main/more.jpg" style="margin-top:7px;"></a>
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div style="height:0px;margin-top:24px;"></div>
            </div>
            <div class="clearfix"></div>
            <c:forEach var="list" items="${art}" varStatus="stat">
                <div class="cgt-latest cgt-list-ctype-1">
                    <div style="position:absolute; width:100%; z-index:100;">
                        <div style="float:right; width:40px; height:40px; border-radius:20px; background-color:#EB009F; color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;">개최중</div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="cgt_latest_image_area">
                        <a href ='/main/view/${list.showcase_num}' target="_blank">
                            <c:set var="file" value="${fn:split(list.file_savname, ',')}" />
                            <img src="${img}${file[0]}" class="img-responsive">
                        </a>
                    </div><!-- img -->
                    <div class="cgt_list_mask" style="width: 284px; height: 295px;"></div>
                    <div class="cgt_list_button">
                        <a class="btn-detail cgt-single-load" href="/main/view/${list.showcase_num}"><img alt="상세보기" src="/resources/image/main/view_small_btn.png"></a>
                        <a class="btn-application cgt-single-load" href="/order/check/${list.showcase_num}"><img alt="신청하기" src="/resources/image/main/application_small_btn.png"></a>
                    </div>
                    <!-- over layer -->
                    <div class="cgt_list_explanation">
                        <div class="subject">${list.subject}</div>
                        <div class="schedule">
                            <fmt:formatDate value="${list.start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.end_date}" pattern="yyyy-MM-dd"/>
                            <fmt:parseNumber value="${ list.start_date.time / (1000*60*60*24) }" integerOnly="true" var="start"/>
                            <fmt:parseNumber value="${ list.end_date.time / (1000*60*60*24) }" integerOnly="true" var="end"/> / ${(end - start) + 1}일간
                        </div>
                        <div class="place_price">
                            <div class="place">${list.address2}</div>
                            <div style="width:30px; height:2px; background-color:#F470C9; margin:20px 0px 10px 0px;"></div>
                            <div class="price">
                                <c:choose>
                                    <c:when test="${list.price eq 0}">
                                        무료
                                    </c:when>
                                    <c:when test="${list.price ne 0}">
                                        ${list.price}원
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div><!-- contents-->
                    <!-- social -->
                    <div class="cgt_list_count clearfix" style="font-size: 12px; color: #666;">
                        <div><img src="/resources/image/main/icon_apply.jpg" class="application_icon"> ${list.ordercount}</div>
                        <div style="margin-right:10px;"><img src="/resources/image/main/icon_eye.jpg" class="view_icon"> ${list.readcount}</div>
                    </div>
                </div>
            </c:forEach>
            <!-- ############################## list3(event) ############################## -->
            <div style="margin:1px auto;padding-top: 48px; clear: both; max-width: 1200px; ">
                <div style="float:left;font-size:20px;font-weight:bold;">
                    <div style="box-sizing: border-box; font-size:16px;">
                        <span style="font-size:18px; font-weight:normal;"><img src="/resources/image/main/title_main_event.jpg"></span>
                    </div>
                </div>
                <div style="float:right;">
                    <div class="boxes">
                        <div class="box box1" style="cursor:pointer;">
                            <a href="/main/event"><img src="/resources/image/main/more.jpg" style="margin-top:7px;"></a>
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div style="height:0px;margin-top:24px;"></div>
            </div>
            <div class="clearfix"></div>
            <c:forEach var="list" items="${event}" varStatus="stat">
                <div class="cgt-latest cgt-list-ctype-1">
                    <div style="position:absolute; width:100%; z-index:100;">
                        <div style="float:right; width:40px; height:40px; border-radius:20px; background-color:#EB009F; color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;">개최중</div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="cgt_latest_image_area">
                        <a href ='/main/view/${list.showcase_num}' target="_blank">
                            <c:set var="file" value="${fn:split(list.file_savname, ',')}" />
                            <img src="${img}${file[0]}" class="img-responsive">
                        </a>
                    </div><!-- img -->
                    <div class="cgt_list_mask" style="width: 284px; height: 295px;"></div>
                    <div class="cgt_list_button">
                        <a class="btn-detail cgt-single-load" href="/main/view/${list.showcase_num}"><img alt="상세보기" src="/resources/image/main/view_small_btn.png"></a>
                        <a class="btn-application cgt-single-load" href="/order/check/${list.showcase_num}"><img alt="신청하기" src="/resources/image/main/application_small_btn.png"></a>
                    </div>
                    <!-- over layer -->
                    <div class="cgt_list_explanation">
                        <div class="subject">${list.subject}</div>
                        <div class="schedule">
                            <fmt:formatDate value="${list.start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.end_date}" pattern="yyyy-MM-dd"/>
                            <fmt:parseNumber value="${list.start_date.time / (1000*60*60*24)}" integerOnly="true" var="start"/>
                            <fmt:parseNumber value="${list.end_date.time / (1000*60*60*24)}" integerOnly="true" var="end"/> / ${(end - start) + 1}일간
                        </div>
                        <div class="place_price">
                            <div class="place">${list.address2}</div>
                            <div style="width:30px; height:2px; background-color:#F470C9; margin:20px 0px 10px 0px;"></div>
                            <div class="price">
                                <c:choose>
                                    <c:when test="${list.price eq 0}">
                                        무료
                                    </c:when>
                                    <c:when test="${list.price ne 0}">
                                        ${list.price}원
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div><!-- contents-->
                    <!-- social -->
                    <div class="cgt_list_count clearfix" style="font-size: 12px; color: #666;">
                        <div><img src="/resources/image/main/icon_apply.jpg" class="application_icon"> ${list.ordercount}</div>
                        <div style="margin-right:10px;"><img src="/resources/image/main/icon_eye.jpg" class="view_icon"> ${list.readcount}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</div>
