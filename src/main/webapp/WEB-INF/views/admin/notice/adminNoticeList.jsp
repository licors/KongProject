<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<script type="text/javascript">
    function delchk() {
        return confirm("삭제하시겠습니까?");
    }
</script>
<table class="table table-hover">
    <thead>
        <tr>
            <th style="width: 5%;text-align:center;vertical-align:middle;">No.</th>
            <th style="width: 65%;text-align:center;vertical-align:middle;">subject</th>
            <th style="width: 8%;text-align:center;vertical-align:middle;">date</th>
            <th style="width: 1%;text-align:center;vertical-align:middle;">read</th>
            <th style="width: 10%;text-align:center;vertical-align:middle;">tool</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${list}" varStatus="stat">
            <tr class="jsearch-row">
                <td style="text-align: center;vertical-align: middle;">${list.notice_num}</td>
                <td class="jsearch-field" style="text-align: left;vertical-align: middle;">&nbsp;<a href="/admin/notice/view/${list.notice_num}">${list.subject}</a></td>
                <td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"></fmt:formatDate></td>
                <td style="text-align: center;vertical-align: middle;">${list.readcount}</td>
                <td style="text-align: center;vertical-align: middle;">
                    <a href=""><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png" style="width: 16px"></a>&nbsp;&nbsp;
                    <a href=""><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" style="width: 16px" onclick="return delchk()"></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>