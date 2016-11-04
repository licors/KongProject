<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script>
<script src="/resources/js/google_map.js" type="text/javascript"></script>
<script>
    geocode('${view.map}', '${view.subject}');
</script>
<table class="table">
    <tr>
        <td colspan="3" style="text-align:left;vertical-align:middle;width:100%;overflow: hidden;text-overflow:ellipsis;white-space:nowrap;"><h2>${view.subject}</h2></td>
    </tr>
    <tr>
        <td rowspan="5" style="text-align:left;vertical-align:middle;width:320px;">
            <img src="${img}${view.file_savname.split(',')[0]}" style="height:auto; width:320px">
        </td>
        <td style="text-align:left;vertical-align:middle;">주소</td>
        <td style="text-align:left;vertical-align:middle;">${view.address1}</td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;">일정</td>
        <td style="text-align:left;vertical-align:middle;">
            <fmt:formatDate value="${view.start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${view.end_date}" pattern="yyyy-MM-dd"/>
            <fmt:parseNumber value="${view.start_date.time / (1000*60*60*24)}" integerOnly="true" var="start"/>
            <fmt:parseNumber value="${view.end_date.time / (1000*60*60*24)}" integerOnly="true" var="end"/> / ${(end - start) + 1}일간
        </td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;">입장료</td>
        <td style="text-align:left;vertical-align:middle;">
            <c:choose>
                <c:when test="${view.price eq 0}">
                    무료
                </c:when>
                <c:when test="${view.price ne 0}">
                    ${view.price}
                </c:when>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;">문의전화</td>
        <td style="text-align:left;vertical-align:middle;">${view.tel}</td>
    </tr>
    <tr>
        <td style="text-align:left;vertical-align:middle;">태그</td>
        <td style="text-align:left;vertical-align:middle;">
            <c:if test="${!empty view.tag}">
                <c:set var="tags" value="${fn:split(view.tag, ',')}" />
                <c:forEach var="silceTags"  items="${tags}" varStatus="stat">
                    <button type="button" class="btn btn-primary btn-xs">${silceTags}</button>&nbsp;
                </c:forEach>
            </c:if>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align:right;vertical-align:middle;">
            <input type="button" value="수정하기" class="btn btn-default btn-sm"
                   onClick="javascript:location.href = '/admin/main/modify/${view.showcase_num}'">
            <input type="button" value="삭제하기" class="btn btn-success btn-sm"
                   onclick="return fnConfirmMoveUrl('정말로 삭제하시겠습니까?', '/admin/main/delete/${view.showcase_num}');">
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align:left;vertical-align:middle;">
            <pre class="text-left" style="background-color: #FDFEFE !important;	border: none !important; border-radius: none !important">${view.content}</pre>
            <br><br>

            <c:if test="${view.file_savname ne null}">
                <c:set var="img_paths" value="${fn:split(view.file_savname, ',')}" />
                <c:forEach var="file" items="${img_paths}" varStatus="stat">
                    <c:if test="${stat.index ne 0}">
                        <div style="text-align: center;"><img src="${img}${file}" style="height:auto; width:320px"></div>
                        </c:if>
                    </c:forEach>
                </c:if>
        </td>
    </tr>
    <c:if test="${view.map ne null}">
        <tr>
            <td colspan="3" style="text-align:center;vertical-align:middle;">
                <div id="map-canvas" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>
            </td>
        </tr>
    </c:if>
</table>
