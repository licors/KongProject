<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<script language="javascript" type="text/javascript"src="js/index.js">

	</script>
	
<script>
function findpasswordcheckIt(){
	if (!document.findpasswordform.email.value) {
		alert("이메일을 입력하세요");
		document.findpasswordform.email.focus();
		return false;
	}
	if (!document.findpasswordform.name.value) {
		alert("이름을 입력하세요");
		document.findpasswordform.name.focus();
		return false;
	}
}


</script>


	<form name="findpasswordform" action="memberpfind.action" method="post"
		onSubmit="return findpasswordcheckIt()">
		<table width="300" align="center">
			<tr>
				<td colspan="2" align="center"><h3>비밀번호 찾기</h3></td>
			</tr>
			<tr>
				<td width="150" align="center">이메일</td>
				<td width="150" align="left"><input
					class="name" type="text" name="email"></td>
			</tr>
			<tr>
				<td width="150" align="center">이름</td>
				<td width="150" align="left"><input
					class="name" type="text" name="name"
					style="ime-mode: Disabled;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" class="btn btn-success"
					 value="확인"></td>
			</tr>

		</table>
	</form>
