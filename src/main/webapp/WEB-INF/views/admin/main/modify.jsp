<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
    $(document).ready(function () {
        $("#selectBox1").val('${view.showcase_category}').prop("selected", true);
        $("#selectBox2").val('${view.address1}').prop("selected", true);
    });
</script>
<form action="/admin/main/modify/${view.showcase_num}" method="post" enctype="multipart/form-data">
    <table align="center">
        <tr>
            <td align="right" colspan="2">
                <font color="#FF0000">*</font>는 필수 입력 사항입니다.
            </td>
        </tr>
        <tr>
            <td width="100"><label for="subject"><font color="#FF0000">&nbsp;&nbsp;*</font>전시명</label></td>
            <td>
                <input class="form-control" type="text" name="subject" value="${view.subject}" size="30" maxlength="50"/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="showboard_category"><font color="#FF0000">&nbsp;&nbsp;*</font>카테고리</label></td>
            <td>
                <select id="selectBox1" name="showcase_category" size="1" class="form-control">
                    <option value="">카테고리</option>
                    <option value="전시">전시</option>
                    <option value="미술">미술</option>
                    <option value="이벤트">이벤트</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="address1"><font color="#FF0000">&nbsp;&nbsp;*</font>장소</label></td>
            <td>
                <select id="selectBox2" name="address1" size="1" class="form-control">
                    <option value="">시/도</option>
                    <option value="서울특별시">서울특별시</option>
                    <option value="부산광역시">부산광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="세종특별자치시">세종특별자치시</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청북도">충청북도</option>
                    <option value="충청남도">충청남도</option>
                    <option value="전라북도">전라북도</option>
                    <option value="전라남도">전라남도</option>
                    <option value="경상북도">경상북도</option>
                    <option value="경상남도">경상남도</option>
                    <option value="제주특별자치도">제주특별자치도</option>
                    <option value="이벤트">이벤트</option>
                </select>
                <input class="form-control" type="text" name="address2" value="${view.address2}" size="30" maxlength="100" placeholder="나머지"/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="date"><font color="#FF0000">&nbsp;&nbsp;*</font>일정</label></td>
            <td>
                <!--                        <input class="form-control" type="text" name="date" value="" size="20" maxlength="35"/>-->
                <label for="birth">시작일:</label>
                <input id="start_date" name="start_date" value="<fmt:formatDate value="${view.start_date}" pattern="yyyy-MM-dd"/>" type="date">
                <label for="birth">종료일:</label>
                <input id="end_date" name="end_date" value="<fmt:formatDate value="${view.end_date}" pattern="yyyy-MM-dd"/>" type="date">
            </td>
        </tr>
        <tr>
            <td width="100"><label for="pay"><font color="#FF0000">&nbsp;&nbsp;*</font>입장료</label></td>
            <td>
                <input class="form-control" type="text" name="price" value="${view.price}" size="10" maxlength="7"/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="tel"><font color="#FF0000">&nbsp;&nbsp;*</font>문의전화</label></td>
            <td>
                <input class="form-control" type="text" name="tel" value="${view.tel}" size="20" maxlength="15"/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="tag">&nbsp;&nbsp;&nbsp;태그</label></td>
            <td>
                <input class="form-control" type="text" name="tag" value="${view.tag}" size="20" maxlength="50" placeholder="구분자 ,"/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="content"><font color="#FF0000">&nbsp;&nbsp;*</font>내용</label></td>
            <td>
                <textarea name="content" cols="67" rows="10" class="form-control">${view.content}</textarea> 
            </td>
        </tr>
        <tr>
            <td width="100"><label for="map"><font color="#FF0000">&nbsp;&nbsp;*</font>지도위치</label></td>
            <td>
                <input class="form-control" type="text" name="map" value="${view.map}" size="40" maxlength="40"/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="file">&nbsp;&nbsp;&nbsp;사진1</label></td>
            <td>
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진2</label></td>
            <td>
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진3</label></td>
            <td>
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td width="100"><label for="upload">&nbsp;&nbsp;&nbsp;사진4</label></td>
            <td>
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <input name="submit" type="submit" value="수정" class="btn btn-default btn-xs">
                <input name="list" type="button" value="돌아가기" class="btn btn-default btn-xs" 
                       onClick="javascript:history.go(-1)">
            </td>
        </tr>
    </table>
</form>
