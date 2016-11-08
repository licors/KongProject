<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>

<table class="table table-hover">
    <thead>
        <tr>
            <th style="width: 5%;text-align:center;vertical-align:middle;">No.</th>
            <th style="width: 35%;text-align:center;vertical-align:middle;">Email</th>
            <th style="width: 20%;text-align:center;vertical-align:middle;">name</th>
            <th style="width: 25%;text-align:center;vertical-align:middle;">company</th>
            <th style="width: 5%;text-align:center;vertical-align:middle;">adminRole</th>
            <th style="width: 10%;text-align:center;vertical-align:middle;"></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${list}" varStatus="stat">
            <tr class="jsearch-row">
                <td style="text-align: center;vertical-align: middle;">${list.member_num}</td>
                <td class="jsearch-field" style="text-align: center;vertical-align: middle;">&nbsp;${list.id_email}</td>
                <td class="jsearch-field" style="text-align: center;vertical-align: middle;">${list.name}</td>
                <td style="text-align: center;vertical-align: middle;">${list.company}</td>
                <td style="text-align: center;vertical-align: middle;">
                	 <c:choose>
                        <c:when test="${list.admin eq 0}">
                            User
                        </c:when>
                        <c:when test="${list.admin eq 1}">
                           	Admin
                        </c:when>
                    </c:choose>
                </td>
                <td style="text-align: center;vertical-align: middle;">
                    <a href="/member/admin/modifyForm/${list.id_email}"><input type="image" alt="수정하기" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png" style="width: 16px"></a>&nbsp;&nbsp;
                    <a href="#" onclick="return fnConfirmMoveUrl('정말로 삭제하시겠습니까?', '/member/admin/delete/${list.id_email}');"><input type="image" alt="삭제하기" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" style="width: 16px"></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>