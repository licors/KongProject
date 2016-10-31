<%-- 
    Document   : main
    Created on : 2016. 10. 25, 오후 5:28:56
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        "${member.member_num}"
        <table>
            <tr>
                <td>
                    <a href="/main/aticle">전시</a><br>
                </td>
                <td>
                    <a href="/main/art">미술</a><br>
                </td>
                <td>
                    <a href="/main/event">이벤트</a><br>
                </td>
            </tr>
        </table>
        <c:forEach var="aticleList"  items="${aticle}" varStatus="stat">
            <a href="/main/view/${aticleList.showcase_num}">${aticleList.showcase_num}. ${aticleList.subject}</a><br>
        </c:forEach>
        ------<br>
        <c:forEach var="artList"  items="${art}" varStatus="stat">
            <a href="/main/view/${artList.showcase_num}">${artList.showcase_num}. ${artList.subject}</a><br>
        </c:forEach>
        ------<br>
        <c:forEach var="eventList"  items="${event}" varStatus="stat">
            <a href="/main/view/${eventList.showcase_num}">${eventList.showcase_num}. ${eventList.subject}</a><br>
        </c:forEach>
    </body>
</html>
