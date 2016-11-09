<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
			<td><form:input class="form-control" type="text"
					path="member_num" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="id_email"><font
					color="#FF0000">&nbsp;&nbsp;*</font>ID</label></td>
			<td><form:input class="form-control" type="text" path="id_email"
					size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="showcase_num"><font
					color="#FF0000">&nbsp;&nbsp;*</font>전시회 번호</label></td>
			<td><form:input class="form-control" type="text"
					path="showcase_num" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="100"><label for="name">&nbsp;&nbsp;이름</label></td>
			<td><form:input class="form-control" type="text" path="name"
					value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="phone"><font
					color="#FF0000">&nbsp;&nbsp;*</font>전화번호</label></td>
			<td><form:input class="form-control" type="text" path="phone"
					value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="area">&nbsp;&nbsp;지역</label></td>
			<td><form:select path="area" class="form-control" name="area">
					<form:options items="${areaOptions }" />
				</form:select></td>
		</tr>
		<tr>
			<td width="100"><label for="company">&nbsp;&nbsp;회사</label></td>
			<td><form:input class="form-control" type="text" path="company"
					value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="100"><label for="sex">&nbsp;&nbsp;성별</label></td>
			<td><label class="radio-inline"><form:radiobutton
						path="sex" id="inlineRadio1" name="sex" value="남성" label="남성" />
			</label> <label class="radio-inline"><form:radiobutton path="sex"
						id="inlineRadio2" name="sex" value="여성" label="여성" /> </label></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="100"><label for="payment_type">&nbsp;&nbsp;일반결제</label></td>
			<td><label class="radio-inline"><form:radiobutton
						path="payment_type" id="inlineRadio1" name="payment_type"
						value="무통장입금" label="무통장입금" /> </label> <label class="radio-inline"><form:radiobutton
						path="payment_type" id="inlineRadio2" name="payment_type"
						value="신용카드" label="신용카드" disabled="true"/> </label> <label class="radio-inline"><form:radiobutton
						path="payment_type" id="inlineRadio3" name="payment_type"
						value="휴대폰" label="휴대폰" disabled="true"/> </label></td>

		</tr>
		<tr>
			<td width="100"><label for="bank_account">&nbsp;&nbsp;입금은행</label></td>
			<td><form:select path="bank_account" class="form-control"
					name="bank_account">
					<form:options items="${bank_account }" />
				</form:select></td>
		</tr>
		<tr>
			<td width="100"><label for="payment_payer">&nbsp;&nbsp;입금자명</label></td>
			<td><form:input path="payment_payer" class="form-control"
					type="text" value="" size="30" maxlength="50" /></td>
		</tr>
		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성" class="btn btn-default btn-xs"> <input
				name="list" type="button" value="돌아가기"
				class="btn btn-default btn-xs"
				onClick="javascript:location.href = '/order/admin/list'"></td>
		</tr>
	</table>
	</form:form>
