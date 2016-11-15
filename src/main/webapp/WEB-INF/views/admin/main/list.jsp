<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<table class="table table-hover">
    <thead>
        <tr>
            <th style="width: 5%; text-align: center; vertical-align: middle;">No.</th>
            <th style="width: 65%; text-align: center; vertical-align: middle;">subject</th>
            <th style="width: 8%; text-align: center; vertical-align: middle;">type</th>
            <th style="width: 8%; text-align: center; vertical-align: middle;">status</th>
            <th style="width: 1%; text-align: center; vertical-align: middle;">read</th>
            <th style="width: 1%; text-align: center; vertical-align: middle;">order</th>
            <th style="width: 10%; text-align: center; vertical-align: middle;">tool</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${list}" varStatus="stat">
            <tr>
                <td style="text-align: center; vertical-align: middle;">${list.showcase_num}</td>
                <td style="text-align: left; vertical-align: middle;">&nbsp;<a href="/admin/main/view/${list.showcase_num}">${list.subject}</a></td>
                <td style="text-align: center; vertical-align: middle;">${list.showcase_category}</td>
                <td style="text-align: center; vertical-align: middle;">
                    <jsp:useBean id="now" class="java.util.Date" />
                    <fmt:parseNumber value="${list.start_date.time / (1000*60*60*24)}" integerOnly="true" var="start" />
                    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="end" />
                    <c:choose>
                        <c:when test="${list.show_status eq 0}">
                            D-${(start - end) + 1}
                        </c:when>
                        <c:when test="${list.show_status eq 1}">
                            개최중
                        </c:when>
                    </c:choose>
                </td>
                <td style="text-align: center; vertical-align: middle;">${list.readcount}</td>
                <td style="text-align: center; vertical-align: middle;">${list.ordercount}</td>
                <td style="text-align: center; vertical-align: middle;"><a href="/admin/main/modify/${list.showcase_num}"><input type="image" alt="수정하기" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png" style="width: 16px"></a>&nbsp;&nbsp; <a href="#" onclick="return fnConfirmMoveUrl('정말로 삭제하시겠습니까?', '/admin/main/delete/${list.showcase_num}');"><input type="image" alt="삭제하기" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" style="width: 16px"></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>