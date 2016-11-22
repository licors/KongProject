<%-- 
    Document   : noticeview
    Created on : 2016. 8. 30, 오후 8:00:38
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@taglib prefix="s" uri="/struts-tags" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>공지사항</title>
    </head>
    <body>
        
                <div class="panel-heading">
                    <div class="form-inline">
                        
                        <div class="form-group" style="float: right">
                             <!-- <s:if test="memresultClass.admin > 0"> -->
                                <input name="support" type="button" value="수정" class="btn btn-success btn-sm"
                                       onClick="javascript:location.href = '/notice/modify?notice_num=${view.notice_num}'" class="btn btn-default">
                                <input name="support" type="button" value="삭제" class="btn btn-default btn-sm"
                                       onClick="javascript:location.href = '/notice/delete?notice_num=${view.notice_num }&currentPage=${list.currentPage }'" class="btn btn-default">
                            <!-- </s:if> --> 
                        </div>
                    </div>
                </div>
                 <div class="panel-body">
                    <p class="lead">${view.subject }</p>
                    <hr>
                    <p class="text-right">작성일&nbsp;<fmt:formatDate value="${view.reg_date}" pattern="yyyy.MM.dd"></fmt:formatDate>&nbsp;&nbsp;&nbsp;조회수&nbsp;${view.readcount }</p>
                    <p class="text-left">${view.content }</p>
                </div> 
                  <%-- <c:forEach var="list" items="${list }"> 
                         <c:url var="viewURL" value="view">
                            <c:param name="notice_num" value="${notice_num }">
                            </c:param>
                            <c:param name="currentPage" value="${currentPage }">
                            </c:param>
                        </c:url> 
                        <tr>
                            <td><p class="text-center">${list.notice_num }</p></td>
                            <td><p class="">&nbsp;<a href="${viewURL}">${list.subject }</a></p></td>
                            <td><p class="text-center">${list.reg_date }</p></td>
                           <fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"></fmt:formatDate> 
                            <td><p class="text-center">${view.content }</p></td>
                        </tr>
                     </c:forEach> --%> 
           
       
    </body>
</html>
