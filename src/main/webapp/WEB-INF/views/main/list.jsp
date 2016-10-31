<%-- 
    Document   : list
    Created on : 2016. 10. 31, 오후 4:02:23
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div style="width:100%; background-color:#FFF; padding:0px 20px 20px 20px;">
            <div id="ContentPanel"></div>
            <section class="content-wrapper main-content clear-fix">
                <div class="cgt-latest-wrap clearfix">
                    <div style="margin:1px auto;padding-top: 48px; clear: both; max-width: 1200px; ">
                        <div style="float:left;font-size:20px;font-weight:bold;">
                            <div style="box-sizing: border-box; font-size:16px;">
                                <span style="font-size:18px; font-weight:normal;">
                                    <c:choose>
                                        <c:when test="${category eq '전시'}">
                                            <img src="/template/image/main/title_main_display.jpg"></img>
                                        </c:when>
                                        <c:when test="${category eq '미술'}">
                                            <img src="/template/image/main/title_main_art.jpg"></img>
                                        </c:when>
                                        <c:when test="${category eq '이벤트'}">
                                            <img src="/template/image/main/title_main_event.jpg"></img>
                                        </c:when>
                                    </c:choose>
                                </span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="boxes">
                                <div class="box box1" style="cursor:pointer;">
                                    <a></a>
                                </div>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                        <div style="height:0px;margin-top:24px;"></div>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <c:forEach var="list" items="${list}" varStatus="stat">
                        <div class="cgt-latest cgt-list-ctype-1">
                            <div style="position:absolute; width:100%; z-index:100;">
                                <div style="float:right; width:40px; height:40px; border-radius:20px;  color:#FFF; text-align:center; font-weight:bold; line-height:40px; margin:10px 10px 0px 0px;"></div>
                                <div style="clear:both;"></div>
                            </div>
                            <a href ='/main/view/${list.showcase_num}' target="_blank">
                                <img src="${img}${list.file_savname.split(',')[0]}" class="img-responsive" onerror="javascript:this.src='/template/image/main/noimg.png'">
                            </a>
                            <div class="cgt_list_explanation">
                                <a href ='/main/view/${list.showcase_num}' target="_blank">
                                    <div class="subject">${list.subject}</div>
                                </a>
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
                                            <c:when test="${list.price} == 0">
                                                무료
                                            </c:when>
                                            <c:when test="${list.price} > 0">
                                                ${list.price}원
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="cgt_list_count clearfix" style="font-size: 12px; color: #666;">
                                <div><img src="/template/image/main/icon_apply.jpg" class="application_icon">${list.ordercount}</div>
                                <div style="margin-right:10px;"><img src="/template/image/main/icon_eye.jpg" class="view_icon">${list.readcount}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>
    </body>
</html>
