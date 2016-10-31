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
        <c:forEach var="aticleList"  items="${aticle}" varStatus="stat">
                <c:url var="viewURL" value="" >
                <c:param name="showcase_num"/>
                <c:param name="currentPage" value="${currentPage}" />
            </c:url>
            
            <a href="/main/view/?showcase_num=${aticleList.showcase_num}&currentPage=${currentPage}">${aticleList.showcase_num}. ${aticleList.subject}</a>
            <br>
        </c:forEach>
        ------<br>
        <c:forEach var="artList"  items="${art}" varStatus="stat">
            ${artList.subject}<br>
        </c:forEach>
        ------<br>
        <c:forEach var="eventList"  items="${event}" varStatus="stat">
            ${eventList.subject}<br>
        </c:forEach>
    </body>
</html>
