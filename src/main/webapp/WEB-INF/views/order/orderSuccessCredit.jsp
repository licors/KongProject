<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${flag eq 0 }">
			<form method="post" name="successcredit"
				action="${contextPath }/order/insert"></form>
		</c:when>
		<c:when test="${flag eq 1 }">
			<form method="post" name="successcredit"
				action="${contextPath }/order/insert_B"></form>
		</c:when>
	</c:choose>
</body>
<script type="text/javascript">
	document.successcredit.submit();
</script>