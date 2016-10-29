
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 체크</title>
<script>
function check() {
	msg = "로그인이 필요한 서비스입니다. 로그인 하시겠습니까?";
	if (confirm(msg)!=0) {
		window.location.href='/member/login';
	} else {
		history.go(-1);
	}
	
}
</script>
</head>
<body>
<script>check()</script>
</body>
</html>

