<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="orderModel" action="/order/admin/insert"
	method="post" enctype="multipart/form-data">
	<table align="center">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>는 필수
				입력 사항입니다.</td>
		</tr>
		<tr>
			<td width="100"><label for="member_num"><font
					color="#FF0000">&nbsp;&nbsp;*</font>회원 번호</label></td>
			<td><input class="form-control" type="text" name="member_num"
				value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="id_email"><font
					color="#FF0000">&nbsp;&nbsp;*</font>ID</label></td>
			<td><input class="form-control" type="text" name="id_email"
				value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="showcase_num"><font
					color="#FF0000">&nbsp;&nbsp;*</font>전시회 번호</label></td>
			<td><input class="form-control" type="text" name="showcase_num"
				value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="name">이름</label></td>
			<td><input class="form-control" type="text" name="name" value=""
				size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="phone">전화번호</label></td>
			<td><input class="form-control" type="text" name="phone"
				value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="sex">성별</label></td>
			<td><label class="radio-inline"><form:radiobutton
						path="sex" id="inlineRadio1" name="sex" value="남성" label="남성" />
			</label> <label class="radio-inline"><form:radiobutton path="sex"
						id="inlineRadio2" name="sex" value="여성" label="여성" /> </label></td>
		</tr>
		<tr>
			<td width="100"><label for="company">회사</label></td>
			<td><input class="form-control" type="text" name="company"
				value="" size="30" maxlength="50" /></td>
		</tr>

		<tr>
			<td width="100"><label for="area">지역</label></td>
			<td><form:select path="area" class="form-control" name="area">
					<form:options items="${areaOptions }" />
				</form:select></td>
		</tr>
		<tr>
			<td width="100"><label for="date"><font color="#FF0000">&nbsp;&nbsp;*</font>일정</label></td>
			<td>
				<!--                        <input class="form-control" type="text" name="date" value="" size="20" maxlength="35"/>-->
				<label for="birth">start_date</label> <input id="start_date"
				name="start_date" type="date"> <label for="birth">end_date</label>
				<input id="end_date" name="end_date" type="date">
			</td>
		</tr>
		<tr>
			<td width="100"><label for="pay"><font color="#FF0000">&nbsp;&nbsp;*</font>입장료</label></td>
			<td><input class="form-control" type="text" name="price"
				value="" size="10" maxlength="7" /></td>
		</tr>
		<tr>
			<td width="100"><label for="tel"><font color="#FF0000">&nbsp;&nbsp;*</font>문의전화</label></td>
			<td><input class="form-control" type="text" name="tel" value=""
				size="20" maxlength="15" /></td>
		</tr>
		<tr>
			<td width="100"><label for="tag">&nbsp;&nbsp;&nbsp;태그</label></td>
			<td><input class="form-control" type="text" name="tag" value=""
				size="20" maxlength="50" placeholder="구분자 ," /></td>
		</tr>

		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성" class="btn btn-default btn-xs"> <input
				name="list" type="button" value="돌아가기"
				class="btn btn-default btn-xs"
				onClick="javascript:location.href = ''"></td>
		</tr>
	</table>
</form:form>