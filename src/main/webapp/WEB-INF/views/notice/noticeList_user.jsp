<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>공지사항</title>
    </head>
    <body>
    <div style="width:100%; background-color:#FFF;">
        <div style="max-width:1200px; margin:0px auto;">
    <div style="padding-top:50px;"></div>
    <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 10px 0px; padding:0px;">공지사항</p>
    <div class="faqborderbottom3px">
        <span class="faqfontsubtitle">KONG의 새로운 정보와 소식을 알려드립니다.</span>
    </div>
                <table align="center" class="table table-hover">
                    <thead>
                        <tr align="center">
                            <td class="col-md-1" style="font-size: 16px"><strong>번호</strong></td>
                            <td class="col-md-9" style="font-size: 16px"><strong>제목</strong></td>
                            <td class="col-md-1" style="font-size: 16px"><strong>작성일</strong></td>
                            <td class="col-md-1" style="font-size: 16px"><strong>조회수</strong></td>
                        </tr>
                    </thead>
                    <c:forEach var="list" items="${list }">
                        <c:url var="viewURL" value="view1">
                            <c:param name="notice_num" value="${list.notice_num }">
                            </c:param>
                            <c:param name="currentPage" value="${currentPage }">
                            </c:param>
                        </c:url>
                        <tr>
                            <td><p class="text-center">${list.notice_num }</p></td>
                            <td><p class="">&nbsp;<a href="/notice/view1/${list.notice_num }">${list.subject }</a></p></td>
                           <%--  <td><p class="text-center">${list.reg_date }</p></td> --%>
                           <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"></fmt:formatDate></td>
                            <td><p class="text-center">${list.readcount }</p></td>
                        </tr>
                    </c:forEach>
                     <c:if test="${list.size() <= 0}"> 
                        <tr align="center">
                            <td colspan="5">등록된 게시물이 없습니다.</td>
                        </tr>
                     </c:if> 
                    <thead>
                        <tr>
                            <td colspan="4" align="center">${pagingHtml }</td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </body>
</html>