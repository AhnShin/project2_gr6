<%@page import="vo.Article"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정할 내용 입력 화면</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
<style>
p{
	text-align : center;
}
</style>
</head>
<body>
<%@include file="top.jsp"%>
<br>
<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span> 감상평 수정 <span class="fixed_w3">]</span> </h2>
			<br>
			</div>
			</div>
	<center>
	<form action="${pageContext.request.contextPath }/board" method="post">
		<input type="hidden" name="task" value="update">
		<input type="hidden" name="articleNum" value="${original.articleNum }">
		<input type="hidden" name="writer" value="${original.writer }">
	<table border="1" class="w3-table-all">
		<tr>
		<td width="400px"></td>
			<td class="w3-grey"><p><b>제목</b></p></td>
			<td>
				<input type="text" name="title" size="50" value="${original.title }">
			</td>
		</tr>
		<tr>
		<td width="400px"></td>
			<td class="w3-grey"><p><b>내용</b></p></td>
			<td>
				<textarea rows="15" cols="50" name="contents">${original.contents}</textarea>
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td colspan="2"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>
	<br>
	<input type="submit" value="작성완료">
	</form>
	</center>
	<br>
<%@include file="footer.jsp"%>
</body>
</html>