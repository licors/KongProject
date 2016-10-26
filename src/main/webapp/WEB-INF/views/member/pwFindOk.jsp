<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<script>
function findpasswordSuccess(password){
	alert("비밀번호는 " + password + " 입니다.");
	//self.close();
}
</script>

<script>
findpasswordSuccess('<c:out value="${password}" />');
</script>