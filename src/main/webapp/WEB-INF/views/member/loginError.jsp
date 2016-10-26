<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function Error(){
	alert("로그인 실패");
	//window.location.href='/showcase/sclist.action';
	history.go(-1);
}
</script>

<script>
Error()
</script>