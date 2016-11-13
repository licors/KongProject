<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<form action="/admin/main/write" method="post" enctype="multipart/form-data">
    <table class="table">
        <tr>
            <td style="text-align:right;vertical-align:middle;border-right:none;border-left:none;border-top:none;border-bottom:none;" colspan="2">
                <font color="#FF0000">*</font>는 필수 입력 사항입니다.
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="subject"><font color="#FF0000">&nbsp;&nbsp;*</font>전시명</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input class="form-control" type="text" name="subject" value=""/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="showboard_category"><font color="#FF0000">&nbsp;&nbsp;*</font>카테고리</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <select name="showcase_category" size="1" class="form-control">
                    <option value="">카테고리</option>
                    <option value="전시">전시</option>
                    <option value="미술">미술</option>
                    <option value="이벤트">이벤트</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="address1"><font color="#FF0000">&nbsp;&nbsp;*</font>장소</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <select name="address1" size="1" class="form-control">
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
                </select>
                <input class="form-control" type="text" name="address2" value="" placeholder="나머지"/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="date"><font color="#FF0000">&nbsp;&nbsp;*</font>일정</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <!--                        <input class="form-control" type="text" name="date" value="" size="20" maxlength="35"/>-->
                <label for="birth">시작일</label>
                <input id="start_date" name="start_date" type="date">
                <label for="birth">종료일</label>
                <input id="end_date" name="end_date" type="date">
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="pay"><font color="#FF0000">&nbsp;&nbsp;*</font>입장료</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input class="form-control" type="text" name="price" value=""/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="tel"><font color="#FF0000">&nbsp;&nbsp;*</font>문의전화</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input class="form-control" type="text" name="tel" value=""/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="tag">&nbsp;&nbsp;&nbsp;태그</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input class="form-control" type="text" name="tag" value="" placeholder="구분자 ,"/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="content"><font color="#FF0000">&nbsp;&nbsp;*</font>내용</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <textarea name="content" rows="10" class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="map">&nbsp;&nbsp;&nbsp;지도위치</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input class="form-control" type="text" name="map" value=""/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="file">&nbsp;&nbsp;&nbsp;사진1</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="upload">&nbsp;&nbsp;&nbsp;사진2</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="upload">&nbsp;&nbsp;&nbsp;사진3</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td class="col-md-2" style="text-align:left;vertical-align:middle;"><label for="upload">&nbsp;&nbsp;&nbsp;사진4</label></td>
            <td class="col-md-9" style="text-align:left;vertical-align:middle;">
                <input type="file" name="upload_file" size="30" value=''/>
            </td>
        </tr>
        <tr>
            <td style="text-align:right;vertical-align:middle;" colspan="2">
                <input name="submit" type="submit" value="작성" class="btn btn-success btn-sm">
                <input name="list" type="button" value="돌아가기" class="btn btn-default btn-sm" 
                       onClick="javascript:history.go(-1)">
            </td>
        </tr>
    </table>
</form>
