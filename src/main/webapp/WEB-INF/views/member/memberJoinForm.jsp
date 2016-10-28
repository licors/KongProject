<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">회원가입</h1>
	<div align="center">
		<input type="checkbox" id="agreement" /><label for="agreement"
			style="cursor: pointer;">서비스 이용약관에 동의 합니다.</label><a
			href="./agree.jsp" target="_blank">(자세히보기 )</a><br> <input
			type="checkbox" id="agreement2" /><label for="agreement2"
			style="cursor: pointer;">개인정보취급방침에 동의 합니다.</label><a
			href="./agree1.jsp" target="_blank">(자세히보기 )</a>

		<form:form commandName="member"
			action="${contextPath}/member/memberJoin" method="post">
			<div align="center">
				<table>

					<tr>
						<td align="center"></td>
						<td><form:input path="id_email" type="text" size="30" maxlength="50"
								placeholder="이메일주소" class="form-control input-lg" />
						</td>
					</tr>
					<tr>
						<td align="center"></td>
						<td><form:input path="password" type="password" size="30"
								maxlength="20" placeholder="비밀번호" class="form-control input-lg" />
						</td>
					</tr>
					<tr>
						<td align="center"></td>
						<td><form:input path="name" type="text" size="30"
								maxlength="20" placeholder="이름" class="form-control input-lg" />
						</td>
					</tr>

					<tr>
						<td align="center"></td>
						<td><input class="btn btn-success btn-lg btn-block"
							type="submit" name="join" value="가입하기" /></td>
					</tr>
				</table>
			</div>
		</form:form>
</body>
</html>