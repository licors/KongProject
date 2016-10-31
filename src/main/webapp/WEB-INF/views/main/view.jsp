<%-- 
    Document   : view
    Created on : 2016. 10. 28, 오후 8:54:36
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        showcase_num :"${view.showcase_num}"<br>
        subject :"${view.subject}"<br>
        address1 :"${view.address1}"<br>
        address2 :"${view.address2}"<br>
        start_date :"<fmt:formatDate value="${view.start_date}" pattern="yyyy-MM-dd"/>"<br>
        end_date :"<fmt:formatDate value="${view.end_date}" pattern="yyyy-MM-dd"/>"<br>
        price :"${view.price}"<br>
        tel :"${view.tel}"<br>
        tag :"${view.tag}"<br>
        content :"${view.content}"<br><c:set var="file" value="${fn:split(view.file_savname, ',')}" /><c:forEach var="fileList"  items="${file}" varStatus="stat">
        file_savname${stat.index} :"${fileList}"<br></c:forEach>
        readcount :"${view.readcount}"<br>
        ordercount :"${view.ordercount}"<br>
        map :"${view.map}"<br>
        show_status :"${view.show_status}"<br>
        showcase_category :"${view.showcase_category}"<br>
    </body>
</html>
