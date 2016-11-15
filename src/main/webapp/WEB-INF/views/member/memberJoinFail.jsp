<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function Error(){
	alert("중복된 Email 입니다. 다른 Email 로 회원가입 해 주세요");
	window.location.href='/member/memberJoin';
}
</script>

<script>
Error()
</script>