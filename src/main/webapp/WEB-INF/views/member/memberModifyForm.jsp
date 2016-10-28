<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function modify() {
	    if (confirm("정보를 수정하시겠습니까?")) {
	    } else {
	        alert("취소되었습니다");
	        return false;
	    }
	}
</script>
</head>
<body>

<h2 align="center">마이페이지</h2>
	<form:form commandName="member" action="${contextPath}/member/memberModify" method="post" name="modifyform">
	    <table>
			<tr>
				<form:input type="hidden" path="member_num"/>
				<form:input type="hidden" path="id_email"/>
				<th scope="row">아이디</th>
				<td>${member.id_email }</td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td>
					<form:input type="password" class="txt w200" path="password" onclick="this.value=''" />
					<font color="red">
						<form:errors path="password" />
					</font>
				</td>
			</tr>
    
    		<tr>
				<th scope="row" id="nameTitle">이름</th>
				<td>
					<form:input type="text" name="name" class="txt w200" path="name" onclick="this.value=''" /> 
					<font color="red">
						<form:errors path="name" />
					</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" id="namephone">전화번호</th>
				<td>
					<form:input type="text" name="phone" class="txt w200" path="phone" onclick="this.value=''" /> 
					<font color="red">
						<form:errors path="company" />
					</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" id="nameCompany">회사</th>
				<td>
					<form:input type="text" name="company" class="txt w200" path="company" onclick="this.value=''" /> 
					<font color="red">
						<form:errors path="company" />
					</font>
				</td>
			</tr>

            <tr>
				<th scope="row" id="nameZipcode">우편번호</th>
				<td>
					<form:input type="text" name="zipcode" class="txt w200" path="zipcode" onclick="this.value=''" /> 
					<font color="red">
						<form:errors path="zipcode" />
					</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" id="nameCompany">주소</th>
				<td>
					<form:input type="text" name="address" class="txt w200" path="address" onclick="this.value=''" /> 
					<font color="red">
						<form:errors path="address" />
					</font>
				</td>
				<td>
					<form:input type="text" name="address2" class="txt w200" path="address2" onclick="this.value=''" /> 
					<font color="red">
						<form:errors path="address2" />
					</font>
				</td>
			</tr>
            	
            <tr height="35">
                <td colspan="2" align="center">
                    <input class="btn btn-success btn-sm" type="submit" name="confirm" value="정보수정" onclick="modify()"> 
                    <input class="btn btn-success btn-sm" type="button" value="회원탈퇴" onClick="javascript:location.href='${contextPath}/member/memberDeleteForm'">
                    <input class="btn btn-default btn-sm" type="button" value="취소" onClick="javascript:location.href='${contextPath}/main">
                </td>
            </tr>
        </table>
    </form:form>

</body>
</html>