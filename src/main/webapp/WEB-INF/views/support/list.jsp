<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="pull-right"><a href="/support/write/${member.member_num}"><div class="cgt_btn_detail_favorite">문의하기</div></a></div>
<table align="center">
    <thead>
        <tr align="center">
            <td width="50" style="font-size: 16px"><strong>번호</strong></td>
            <td width="200" style="font-size: 16px"><strong>종류</strong></td>
            <td width="200" style="font-size: 16px"><strong>이메일</strong></td>
            <td width="50" style="font-size: 16px"><strong>등록일</strong></td>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${list}" varStatus="stat">
            <tr>
                <td align="center">${list.support_num}</td>	
                <td align="left">&nbsp;<c:if test="${list.re_level ne null}"><c:forEach var = "i" begin = "${list.re_level}" end = "0">&nbsp;</c:forEach>→</c:if><a href="/support/view/${list.support_num}">${list.type}</a></td>
                <td align="center">${list.email}</td>
                <td align="center">${list.reg_date}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
