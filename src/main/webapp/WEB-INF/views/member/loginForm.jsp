<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<script type="text/javascript">

	function openPwfind() {
		var url = "memberPwFind";
		open(
				url,
				"confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
</script>
<body>
	<div id="header">
		<div id="container" style="padding-top: 7%">
			<div class="contents1">

				<div class="path">
					<h3>현재 위치</h3>

				</div>

				<div class="titleArea">
					<h2>
						<img src="/pet/resources/images/SkinImg/login.gif" alt="멤버십 로그인" />
					</h2>
				</div>



				<form:form commandName="member" action="${contextPath}/member/login"
					method="post" name="joinform">
					<div class="xans-element- xans-member xans-member-login">

						<div class="login">
							<h3>
								<img src="/pet/resources/images/SkinImg/h3_login.png"
									alt="회원로그인" />
							</h3>
							<fieldset>
								<legend>회원로그인</legend>
								<label class="id"><img
									src="/pet/resources/images/SkinImg/id.gif" alt="id" /> <form:input
										id="member_id" name="id" class="inputTypeText" type="text"
										path="id" /> <%--   <form:input class="inputTypeText" path="id" id="member_id" name="id" type="text" /> --%>
								</label> <label class="password"><img
									src="/pet/resources/images/SkinImg/pw.gif" alt="PW" /> <form:input
										id="member_passwd" name="password" type="password"
										path="password" /> <%-- <form:input id="member_passwd" type="password" path="password" /> --%></label>

								<p class="security"></p>
								<ul>
									<li><a href="#none" title="아이디찾기(새창으로 열기)"
										onclick="return openIdfind()" id="postBtn"> 아이디찾기</a></li>
									<li><a href="#none" title="비번찾기(새창으로 열기)"
										onclick="return openPwfind()" id="postBtn"> 비밀번호찾기</a></li>
								</ul>
							</fieldset>
						</div>
						<div class="login_btn">


							<input TYPE="IMAGE"
								src="/pet/resources/images/SkinImg/btn_login.gif" name="Submit"
								value="Submit" />

						</div>
						<div class="join">
							<h3>
								<img src="/pet/resources/images/SkinImg/h3_join.png" alt="회원가입" />
							</h3>
							<p>
								아직 오키독키 회원이 아니십니까?<br />회원을 위한 다양한 혜택이 준비되어 있습니다.
							</p>
						</div>
						<div class="join_btn">
							<a href="/member/member"><img
								src="/pet/resources/images/SkinImg/btn_join.gif" alt="회원가입" /></a>
						</div>

					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>