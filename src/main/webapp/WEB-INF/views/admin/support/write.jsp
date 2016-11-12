<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<form:form commandName="supportModel" action="/admin/support/write/${view.support_num}" method="post">
    <%--<form:hidden path="support_num" value="${view.support_num}" />--%>
    <table class="table">
        <tr>
            <td class="col-md-1" style="text-align:center;vertical-align:middle;"><label for="type">type</label></td>
            <td class="col-md-9" style="text-align:center;vertical-align:middle;">
                <input id="type" class="form-control" type="text" name="type" value="답변" readonly=""/>
                <font color="red"><form:errors path="type" /></font>
            </td>
        </tr>
        <tr>
            <td class="col-md-1" style="text-align:center;vertical-align:middle;"><label for="email">To</label></td>
            <td class="col-md-9" style="text-align:center;vertical-align:middle;">
                <input id="email" class="form-control" type="text" name="email" value="${view.email}" readonly=""/>
                <font color="red"><form:errors path="email" /></font>
            </td>
        </tr>
        <tr>
            <td class="col-md-1" style="text-align:center;vertical-align:middle;"><label for="content">content</label></td>
            <td class="col-md-9" style="text-align:center;vertical-align:middle;">
                <textarea id="content" name="content" rows="5" class="form-control" placeholder="답변내용"></textarea>
                <font color="red"><form:errors path="content" /></font>
            </td>
        </tr>
        <tr>
            <td class="col-md-10" style="text-align:center;vertical-align:middle;" colspan="2">
                <input name="submit" type="submit" value="작성" class="btn btn-success btn-sm">
                <input name="list" type="button" value="돌아가기" class="btn btn-default btn-sm" 
                       onClick="javascript:history.go(-1)">
            </td>
        </tr>
    </table>
</form:form>
