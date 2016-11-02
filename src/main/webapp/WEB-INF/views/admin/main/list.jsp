<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover">
    <thead>
        <tr style="text-align:center;vertical-align:middle;">
            <th style="width: 5%;">No.</th>
            <th style="width: 80%;">subject</th>
            <th style="width: 5%;">status</th>
            <th style="width: 5%;">readcount</th>
            <th style="width: 5%;">ordercount</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${list}" varStatus="stat">
            <tr style="text-align:center;vertical-align:middle;">
                <td>${list.showcase_num}</td>
                <td align="left">&nbsp;<a href="">${list.subject}</a></td>
                <td align="center">${list.show_status}</td>
                <td align="center">${list.readcount}</td>
                <td align="center">${list.ordercount}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
