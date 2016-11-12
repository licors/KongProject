<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table class="table table-hover">
    <thead>
        <tr>
            <td style="width:5%;text-align:center;vertical-align:middle;">No.</td>
            <td style="width:15%;text-align:left;vertical-align:middle;">type</td>
            <td style="width:50%;text-align:left;vertical-align:middle;">content</td>
            <td style="width:20%;text-align:center;vertical-align:middle;">enquirer</td>
            <td style="width:10%;text-align:center;vertical-align:middle;">date</td>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${list}" varStatus="stat">
            <tr>
                <td style="text-align:center;vertical-align:middle;">${list.support_num}</td>
                <td style="text-align:left;vertical-align:middle;">${list.type}</td>
                <td style="text-align:left;vertical-align:middle;"><a href="/admin/support/view/${list.support_num}"><c:if test="${list.re_level ne 0}"><c:forEach var = "i" begin = "${list.re_level}" end = "0">&nbsp;</c:forEach>→</c:if><c:choose><c:when test="${fn:length(list.content) > 50}"><c:out value="${fn:substring(list.content,0,49)}"/>...</c:when><c:otherwise><c:out value="${list.content}"/></c:otherwise></c:choose></a></td>
                <td style="text-align:center;vertical-align:middle;">${list.email}</td>
                <td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

