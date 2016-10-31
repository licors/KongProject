<%-- 
    Document   : list
    Created on : 2016. 10. 31, 오후 4:02:23
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="List"  items="${list}" varStatus="stat">
            <a href="/main/view/${List.showcase_num}">${List.showcase_num}. ${List.subject}</a><br>
        </c:forEach>
    </body>
</html>
