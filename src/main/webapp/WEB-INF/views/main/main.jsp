<%-- 
    Document   : main
    Created on : 2016. 10. 25, 오후 5:28:56
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="aticleList"  items="${aticle}" varStatus="stat">
                ${aticleList.subject}<br>
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
