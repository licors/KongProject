<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form commandName="orderModel">
<jsp:forward page="/order/form">
	<jsp:param value="${orderModel.showcase_num }" name="showcase_num"/>
</jsp:forward>
</form:form>
