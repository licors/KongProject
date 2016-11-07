<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신 청 완 료</title>
</head>
<body>
	<center>
		<tr>
			<td bgcolor="white" height="50" align="center" width="170"
				colspan="2">
				<h3>
					신청이 <font color="red"><b>완료</b></font>되었습니다.
				</h3> <br>
			</td>
		</tr>
		
		<table width="400" cellpadding="7" cellspacing="2"
			bordercolordark="white" bordercolorlight="white" bgcolor="#E1E1E1"
			style="margin: 20px 0 0 0;">
			<tbody align="center">
				<b> 전시회에 입장하실 때 바코드를 제시해 주세요. </b>
				<br /> 바코드는 신청내역에서 확인하실 수 있습니다.
				<br />
				<br />
				<tr>
					5초후에 메인으로 이동합니다.
					<meta http-equiv="Refresh" content="5;url=/main">
				</tr>
				<br>
				<input type="button" value="신청목록"
					onclick="javascript:location.href='/order/list/1'"
					class="btn btn-success btn-sm"> &nbsp;&nbsp;&nbsp;
				<input type="button" value="메인으로"
					onclick="javascript:location.href='/main'"
					class="btn btn-default btn-sm">
				<br>
			</tbody>
		</table>
	</center>
</body>
</html>