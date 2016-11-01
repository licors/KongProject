<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
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
						<form:hidden path="showcase_num" value=${showcase_num }/>
						<s:hidden name="showboard_num" value="%{showboard_num}" />
						<s:hidden name="member_num" value="%{member_num}" />
						<s:hidden name="ref" value="0"></s:hidden>
				
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
									<input name="back" type="button" value="뒤로" class="btn btn-default" onClick="javascript:location.href='/showcase/scread.action?showboard_num=<s:property value="%{showboard_num}"/>'">
								</td>
							</tr>
							<tr>
								<s:if test="login_member_num == -1">
									<td><a href="/member/memberLogin.jsp">로그인</a> 하셔야 이용하실 수 있습니다.</td>
								</s:if>
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
					
							<s:iterator value="list" status="stat">
								<s:url id="viewURL" action="commentModifyFormAction">
									<s:param name="comment_num">
										<s:property value="comment_num" />
									</s:param>
									<s:param name="showboard_num">
										<s:property value="showboard_num" />
									</s:param>
								</s:url>
					
								<tr>
									<td width="300" align="left"><s:property value="content" /></td>
									<td width="70" align="center"><s:property value="name" /></td>
									<td width="80" align="center"><s:property value="reg_date"/></td>
									<td width="50" align="center">
										<s:if test="login_member_num == member_num">
											<a href="javascript:location.href='${viewURL}'">수정</a>
										</s:if>
									</td>
									<td width="50" align="center">
										<s:if test="login_member_num == member_num">
											<a href='javascript:location.href="/comment/commentdeleteAction.action?comment_num=<s:property value='%{comment_num}'/>"'>삭제</a>
										</s:if>
									</td>
								</tr>
							</s:iterator>
					
							<s:if test="list.size() <= 0">
								<tr>
									<td colspan="5" align="center">등록된 게시물이 없습니다</td>
								</tr>
							</s:if>
							<tr align="center">
								<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>