
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ</title>
    </head>
    <body>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-inline">
                        <div class="form-group">
                            <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">자주 물어보시는 질문입니다.</p>
                        </div>
                        <div class="form-group" style="float: right">
                            <input name="support" type="button" value="1:1 문의"
                                   onClick="javascript:location.href = '/support/supportlist'" class="btn btn-default">
                         <%--    <c:if test="memresultClass.admin > 0"> --%>
                                <input name="support" type="button" value="QnA 추가"
                                       onClick="javascript:location.href = '/faq/write'" class="btn btn-default">
                      <%--       </c:if> --%>
                        </div>
                    </div>
                </div>
                <table align="center" class="table table-striped">
                    <c:forEach var="list" items="${list}">
                        <tr>
                            <td colspan="1" width="50" align="center"><strong>Q.</strong></td>
                            <td colspan="2" width="430" align="left">${list.subject }</td>
                            <%-- <c:if test="memresultClass.admin > 0"> --%>
                                <td colspan="3" width="120" align="center">
                                    <input name="support" type="button" value="수정" onClick="javascript:location.href = '/faq/modify?faq_num=${list.faq_num }'" class="btn btn-default btn-xs">
                                    <input name="support" type="button" value="삭제" onClick="javascript:location.href = '/faq/delete?faq_num=${list.faq_num }'" class="btn btn-default btn-xs">
                                </td>
                            <%-- </c:if> --%>
                        </tr>
                        <tr>
                            <td colspan="1" width="50" align="center"><strong>A.</strong></td>
                            <td colspan="2" width="550"><pre class="text-left" style="background-color: rgba( 255, 255, 255, 0.0 );border: none !important; border-radius: initial !important;color: none !important;margin: 0px 0px 0px 0px;">${list.content }</pre></td>
                            <td colspan="3"></td>
                        </tr>
                   </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
