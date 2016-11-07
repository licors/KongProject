<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
</head>
<body>
	<h2 align="center">문화를 즐기는 방법, 캔고루에 오신 것을 환영합니다.</h2>
	<form name="form1" method="post" action="/loginProcess">
		<div align="center">
			<table>
				<tr>
					<td align="center"></td>
					<td valign="middle" align="left">
						<input name="id_email" type="text" size="30" maxlength="50" placeholder="이메일주소"
							class="form-control input-lg"/>
					</td>
				</tr>

				<tr>
					<td align="center"></td>
					<td valign="middle" align="left">
						<input type="password" name="password" size="30" maxlength="20" placeholder="비밀번호"
							class="form-control input-lg"/>
					</td>
				</tr>

				<tr>
					<td align="right" colspan="2">
						<input name="submit" class="btn btn-success btn-lg btn-block" type="submit" value="로그인"
							class="inputb"/><br>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center">
						<input type="button" class="btn btn-success" value="회원가입" onClick="javascript:location.href='${contextPath}/member/memberJoin'">
						<input type="button" class="btn btn-success" value="비밀번호 찾기" onClick="javascript:location.href='${contextPath}/member/memberPwFind'">
						<!-- 테스트용 -->
						<input type="button" class="btn btn-success" value="로그아웃" onClick="javascript:location.href='${contextPath}/member/logout'">
						<input type="button" class="btn btn-success" value="수정" onClick="javascript:location.href='${contextPath}/member/memberModifyForm'">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<%-- <form:form commandName="member" action="${contextPath}/member/login" method="post" name="joinform">
		<!-- <form name="loginform" action="/member/memberLogin.action" method="post" onsubmit="return checkIt()"> -->
		<div align="center">
			<table>
				<tr>
					<td align="center"></td>
					<td valign="middle" align="left">
						<form:input path="id_email" name="id_email" type="text" size="30" maxlength="50" placeholder="이메일주소"
							class="form-control input-lg"/>
					</td>
				</tr>

				<tr>
					<td align="center"></td>
					<td valign="middle" align="left">
						<form:input path="password" type="password" name="password" size="30" maxlength="20" placeholder="비밀번호"
							class="form-control input-lg"/>
					</td>
				</tr>

				<tr>
					<td align="right" colspan="2">
						<input name="submit" class="btn btn-success btn-lg btn-block" type="submit" value="로그인"
							class="inputb"/><br>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center">
						<input type="button" class="btn btn-success" value="회원가입" onClick="javascript:location.href='${contextPath}/member/memberJoin'">
						<input type="button" class="btn btn-success" value="비밀번호 찾기" onClick="javascript:location.href='${contextPath}/member/memberPwFind'">
						<!-- 테스트용 -->
						<input type="button" class="btn btn-success" value="로그아웃" onClick="javascript:location.href='${contextPath}/member/logout'">
						<input type="button" class="btn btn-success" value="수정" onClick="javascript:location.href='${contextPath}/member/memberModifyForm'">
					</td>
				</tr>
			</table>
		</div>
	</form:form> --%>
</body>
</html>