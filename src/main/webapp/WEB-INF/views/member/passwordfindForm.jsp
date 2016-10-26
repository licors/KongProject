<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>password Find</title>
</head>
<body>
	<form:form commandName="member" name="findpasswordform" action="${contextPath}/member/memberPwFind" method="post">
		<table width="300" align="center">
			<tr>
				<td colspan="2" align="center"><h3>비밀번호 찾기</h3></td>
			</tr>
			<tr>
				<td width="150" align="center">이메일</td>
				<td width="150" align="left">
					<input class="id_email" type="text" name="id_email">
				</td>
			</tr>
			<tr>
				<td width="150" align="center">이름</td>
				<td width="150" align="left">
					<input class="name" type="text" name="name" style="ime-mode: Disabled;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-success" value="확인">
				</td>
			</tr>

		</table>
	</form:form>
</body>
</html>