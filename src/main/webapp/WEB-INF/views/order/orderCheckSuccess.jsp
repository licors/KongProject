<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="orderModel" method="post" name="chkSuccess" action="${contextPath }/order/form">
		<form:hidden path="showcase_num" value="${orderModel.showcase_num }"/>
	</form:form>
</body>
<script type="text/javascript">
document.chkSuccess.submit();
</script>