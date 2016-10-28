<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="member" action="${contextPath}/member/memberDelete" method="post" name="deleteform">
		<!-- <form name="loginform" action="/member/memberLogin.action" method="post" onsubmit="return checkIt()"> -->
		<div align="center">
			<table>
				<tr>
					<td align="center"></td>
					<td valign="middle" align="left">
						<form:input path="password" type="password" name="password" size="30" maxlength="20" placeholder="비밀번호"
							class="form-control input-lg"/>
					</td>
				</tr>

				<tr>
					<td align="right" colspan="2">
						<input name="submit" class="btn btn-success btn-lg btn-block" type="submit" value="확인" class="inputb"/><br>
					</td>
					<td>
						<input type="button" class="btn btn-success" value="취소" onClick="javascript:location.href='${contextPath}/member/memberModifyForm'">
					</td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>