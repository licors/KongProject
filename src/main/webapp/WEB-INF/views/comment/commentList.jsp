<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<br>
	<div class="container" style="width: 610px; max-width: none !important;"> <!-- 여기 선언해서 고정폭사용 -->
	    <div class="panel panel-default"> <!-- 위쪽 제목 -->
	        <div class="panel-heading">댓글</div>
                <div class="panel-body"> <!-- 본문 -->
					<!-- 코멘트 입력 폼 -->
					<form:form commandName="commentModel" name="commentForm" action="/comment/commentWriteAction.action" method="post" onsubmit="return validation();">
						<div class="form-group">
						<form:hidden path="showcase_num" value=${commentModel.showcase_num }/>
						<form:hidden path="member_num" value=${commentModel.member_num }/>
						<%-- <form:hidden path=""/>
						<s:hidden name="showboard_num" value="%{showboard_num}" />
						<s:hidden name="member_num" value="%{member_num}" />
						<s:hidden name="ref" value="0"></s:hidden> --%>
				
						<table width="550" border="0" cellspacing="0" cellpadding="0" class="table-condensed">
							<tr>
								<td align="left">
									내용<br>
									<textarea name="content" rows="3" class="form-control"></textarea>
								</td>
							</tr>
							<tr>
								<td align="right">
									<input name="submit" type="submit" value="댓글입력" class="btn btn-success">
									<input name="back" type="button" value="뒤로" class="btn btn-default" onClick="javascript:location.href='/main/view/${commentModel.showcase_num}'">
								</td>
							</tr>
							<tr>
								<%--시큐리티 만들고 구현
								<c:if test="${commentModel.memberNum eq -1}">
									<td><a href="/member/memberLogin.jsp">로그인</a> 하셔야 이용하실 수 있습니다.</td>
								</c:if> --%>
							</tr>
						</table>
						</div>
					</form:form>
					<br><br><br>
					<!-- 코멘트 리스트 -->
					<form id="commentList">
						<div class="form-group">
						<table id="listTable" width="550" border="0" cellspacing="0" cellpadding="0" class="table">
							<tr align="center" bgcolor="#f3f3f3">
								<td width="300"><strong>내용</strong></td>
								<td width="70"><strong>글쓴이</strong></td>
								<td width="80"><strong>날짜</strong></td>
								<td width="50">수정</td>
								<td width="50">삭제</td>
							</tr>
					
							<c:forEach items="" var="">
								<tr>
									<td width="300" align="left"><s:property value="content" /></td>
									<td width="70" align="center"><s:property value="name" /></td>
									<td width="80" align="center"><s:property value="reg_date"/></td>
									<td width="50" align="center">
										<!-- <s:if test="login_member_num == member_num"> -->
											<a href="javascript:location.href='${viewURL}'">수정</a>
										<!-- </s:if> -->
									</td>
									<td width="50" align="center">
										<!-- <s:if test="login_member_num == member_num"> -->
											<a href='javascript:location.href="/comment/commentdeleteAction.action?comment_num=<s:property value='%{comment_num}'/>"'>삭제</a>
										<!-- </s:if> -->
									</td>
								</tr>
							</c:forEach>
					
							<c:if test="list.size() <= 0">
								<tr>
									<td colspan="5" align="center">등록된 게시물이 없습니다</td>
								</tr>
							</c:if>
							<tr align="center">
								<td colspan="5">${pagingHtml}</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>