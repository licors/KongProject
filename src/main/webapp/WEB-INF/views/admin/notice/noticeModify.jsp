<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>공지사항</title>
    </head>
    <body>
        
                    <!-- <s:if test="rc == null"> -->
                        <%-- <form:form commandName="noticeModel" action="/notice/write" method="post"> --%>
                        <!-- </s:if> -->
                         <!-- <s:else> -->
                            <form:form commandName="noticeModel" action="/notice/modify" method="post">
                                <input type=hidden name="notice_num" value="${noticeModel.notice_num}"/>
                                <input type=hidden name="currentPage" value="${currentPage}"/>
                            <!-- </s:else> -->
                            <table align="center" class="table-condensed">
                                <tr>
                                    <td align="right" colspan="2">
                                        <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="subject"><font color="#FF0000">*</font>제목</label>
                                    </td>
                                    <td>
                                        <input type="text" name="subject" value="${noticeModel.subject }" size="60" maxlength="25" placeholder="제목을 입력하세요." class="form-control" id="subject"/>
                                        <font color="red"><form:errors path="subject" /></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="content"><font color="#FF0000">*</font>내용</label><br>
                                    </td>
                                    <td>
                                        <textarea name="content" rows="10" placeholder="내용을 입력하세요." class="form-control" id="content">${noticeModel.content }</textarea>
                                    	<font color="red"><form:errors path="content" /></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <input name="submit" type="submit" value="작성완료" class="btn btn-default btn-xs">
                                    </td>
                                </tr>
                            </table>
                        </form:form>
             
           
       
    </body>
</html>