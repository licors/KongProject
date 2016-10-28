<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function Error(){
	alert("삭제 실패 : 비밀번호가 다릅니다.");
	//window.location.href='/showcase/sclist.action';
	history.go(-1);
}
</script>

<script>
Error()
</script>