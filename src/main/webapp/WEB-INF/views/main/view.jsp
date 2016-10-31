<%-- 
    Document   : view
    Created on : 2016. 10. 28, 오후 8:54:36
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>상세보기</title>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyCRSeEVl3pSPGUVWwW4DSwZNDu0Q3AuSpc"></script>
        <script src="/js/google_map.js" type="text/javascript"></script>
    </head>
    <script type="text/javascript">
        //이미지 크기 변환
        function fitImageSize(obj, href, maxWidth, maxHeight) {
            var image = new Image();
            image.onload = function () {

                var width = image.width;
                var height = image.height;
                var scalex = maxWidth / width;
                var scaley = maxHeight / height;
                var scale = (scalex < scaley) ? scalex : scaley;
                if (scale > 1)
                    scale = 1;

                obj.width = scale * width;
                obj.height = scale * height;

                obj.style.display = "";
            }
            image.src = href;
        }
    </script>
    <body>
        <div style="background-color: #FDFEFE">
            <script>
                geocode('${view.map}', '${view.subject}');
            </script>
            <div class="container" style='width:600px; max-width:none !important;'>
                <div class="form-group">
                    <table class="table">
                        <tr>
                            <td colspan="3" align="left"><h2>${view.subject}</h2></td>
                        </tr>
                        <tr>
                            <td rowspan="5" align="center" width="200">
                                <img src="${img}${view.file_savname.split(',')[0]}" width="150" height="200" border="0"></td>
                            </td>
                            <td>주소</td>
                            <td>${view.address1}</td>
                        </tr>
                        <tr>
                            <td>일정</td>
                            <td><fmt:formatDate value="${view.start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${view.end_date}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        <tr>
                            <td>입장료</td>
                            <td>
                                <c:choose>
                                    <c:when test="${view.price} == 0">
                                        무료
                                    </c:when>
                                    <c:when test="${view.price} > 0">
                                        ${view.price}
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>문의전화</td>
                            <td>${view.tel}</td>
                        </tr>
                        <tr>
                            <td>태그</td>
                            <td>
                                <c:if test="${view.tag} != null">
                                    <c:set var="tags" value="${fn:split(view.tag, ',')}" />
                                    <c:forEach var="silceTags"  items="${tags}" varStatus="stat">
                                        <button type="button" class="btn btn-primary btn-xs">${silceTags}</button>&nbsp;
                                    </c:forEach>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="right">
                                <input name="basket" type="button" value="관심티켓" class="btn btn-default btn-sm"
                                       onClick="javascript:location.href = '/basket/add/${view.showcase_num}'">
                                <input name="order" type="button" value="신청하기" class="btn btn-success btn-sm"
                                       onClick="javascript:location.href = '/order/check/${showcase_num}'">
                                <input name="comment" type="button" value="댓글달기" class="btn btn-default btn-sm"
                                       onClick="javascript:location.href = '/comment/null/'">
                                <input name="basket" type="button" value="메인으로" class="btn btn-default btn-sm"
                                       onClick="javascript:location.href = '/main'">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <pre class="text-left" style="background-color: #FDFEFE !important;	border: none !important; border-radius: none !important">${view.content}</pre>
                                <br><br>

                                <c:if test="${view.file_savname} != null">
                                    <c:set var="img_paths" value="${fn:split(view.file_savname, ',')}" />
                                    <c:forEach var="file" items="${img_paths}" varStatus="stat">
                                        <c:if test="${stat.index != 0}">
                                            <img src="${img}${file}" onload="javascript:fitImageSize(this, '${img}${file}', 300, 1000);" style="display:none" >
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </td>
                        </tr>
                        <c:if test="${view.map} != null">
                            <tr>
                                <td colspan="3" align="center">
                                    <div id="map-canvas" style="height: 300px; width: 550px"></div>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>