<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table align="center" class="table table-hover">
    <thead>
        <tr align="center">
            <th style="width: 5%;text-align:center;vertical-align:middle;">No.</th>
            <th style="width: 65%;text-align:center;vertical-align:middle;">subject</th>
            <th style="width: 8%;text-align:center;vertical-align:middle;">date</th>
            <th style="width: 10%;text-align:center;vertical-align:middle;">read</th>
        </tr>
    </thead>
    <c:forEach var="list" items="${list }">
        <c:url var="viewURL" value="view">
            <c:param name="notice_num" value="${list.notice_num }">
            </c:param>
            <c:param name="currentPage" value="${currentPage }">
            </c:param>
        </c:url>
        <tr>
            <td style="text-align: center; vertical-align: middle;">${list.notice_num }</td>
            <td style="text-align: left; vertical-align: middle;">&nbsp;<a href="/notice/view/${list.notice_num }">${list.subject }</a></td>
                    <%--  <td><p class="text-center">${list.reg_date }</p></td> --%>
            <td style="text-align: center; vertical-align: middle;"><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"></fmt:formatDate></td>
            <td style="text-align: center; vertical-align: middle;">${list.readcount }</td>
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
