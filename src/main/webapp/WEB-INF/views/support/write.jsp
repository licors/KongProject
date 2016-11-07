<%-- 
    Document   : write
    Created on : 2016. 11. 8, 오전 2:01:50
    Author     : Li
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form name="support" action="/support/write/${member.member_num}" method="post">
    <table align="center" class="table-condensed">
        <tr>
            <td align="right" colspan="2">
                <font color="#FF0000">*</font>는 필수 입력 사항입니다.
            </td>
        </tr>
        <tr>
            <td width="180">
                <font color="#FF0000">&nbsp;&nbsp;*</font>무엇이 궁금하세요
            </td>
            <td width="420">
                <select name="type" size="1" class="form-control">
                    <option value="">무엇이 궁금하세요</option>
                    <option value="전시/행사/공연 제보">전시/행사/공연 제보</option>
                    <option value="제휴문의">제휴문의</option>
                    <option value="앱 사용/오류 문의">앱 사용/오류 문의</option>
                    <option value="결제 및 환불 문의">결제 및 환불 문의</option>
                    <option value="기타문의">기타문의</option>
                    <option value="전시회(부스)참가문의">전시회(부스)참가문의</option>
                </select>    
            </td>
        </tr>
        <tr>
            <td width="180">
                <font color="#FF0000">&nbsp;&nbsp;*</font>이메일
            </td>
            <td width="420">
                <input class="form-control" type="text" name="email" value="" size="20" maxlength="50"/>
            </td>
        </tr>
        <tr>
            <td rowspan="2" width="180">
                <font color="#FF0000">&nbsp;&nbsp;*</font>문의내용
            </td>
            <td rowspan="2" width="420">
                <textarea name="content" cols="57" rows="10" class="form-control"></textarea> 
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <input name="submit" type="submit" value="보내기" class="btn btn-default btn-xs">
            </td>
        </tr>
    </table>
</form>
