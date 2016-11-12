<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table">
    <tr>
        <td style="text-align:left;vertical-align:middle;width:20%">No.</td>
        <td style="text-align:left;vertical-align:middle;">${view.support_num}</td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;width:20%">date</td>
        <td style="text-align:left;vertical-align:middle;"><fmt:formatDate value="${view.reg_date}" pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;width:20%">email</td>
        <td style="text-align:left;vertical-align:middle;">${view.email}</td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;width:20%">type</td>
        <td style="text-align:left;vertical-align:middle;">${view.type}</td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;width:20%">content</td>
        <td style="text-align:left;vertical-align:middle;">${view.content}</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:right;vertical-align:middle;">
            <input type="button" value="답변하기" class="btn btn-success btn-sm"
                   onClick="javascript:location.href = '/admin/support/write/${view.support_num}'">
            <input name="list" type="button" value="돌아가기" class="btn btn-default btn-sm" 
                   onClick="javascript:history.go(-1)">
        </td>
    </tr>
</table>
