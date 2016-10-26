<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ 추가</title>
    </head>
    <body>
        <div class="container" style="width: 900px; max-width: none !important;">
            <div class="panel panel-default">
                <div class="panel-heading"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">FAQ</p></div>
                <div class="panel-body">
                
                <form:form commandName="faqModel" action="/faq/modify" method="post">
                <input name="faq_num" type="hidden" value="${faqModel.faq_num }"/>
  	<table align="center" class="table-condensed">
                                <tr>
                                    <td align="right" colspan="2">
                                        <font color="#FF0000">*</font>는 필수 입력 사항입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50" align="center"><label for="subject"><font color="#FF0000">&nbsp;&nbsp;*</font>Q.</label></td>
                                    <td>
                                            <input class="form-control" type="text" name="subject" value="${faqModel.subject }" size="20" maxlength="50" id="subject"/>
                                            <font color="red"><form:errors path="subject" /></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" width="50" align="center"><label for="content"><font color="#FF0000">&nbsp;&nbsp;*</font>A.</label></td>
                                    <td rowspan="2">

                                            <textarea name="content" cols="57" rows="10" class="form-control" id="content">${faqModel.content }</textarea> 
                                            <font color="red"><form:errors path="content" /></font>
 
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <input name="submit" type="submit" value="작성완료" class="btn btn-default btn-xs">
                                    </td>
                                    
                                </tr>
                            </table>
                        </form:form>
                                  </div>
            </div>
        </div>
    </body>
</html>