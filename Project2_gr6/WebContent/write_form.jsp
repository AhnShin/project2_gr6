<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 작성</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
p{
	text-align : center;
}
</style>
</head>
<body>
<%@include file="top.jsp"%>
<br>
	<form action="${pageContext.request.contextPath }/board" method="post">
		<input type="hidden" name="task" value="write">
		<input type="hidden" name="writer" value="${sessionScope.loginId }">
		<input type="hidden" name="replyNum" value="${original.articleNum }">
		<input type="hidden" name="reply" value="${reply }">
	<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span> 감상평 글쓰기 <span class="fixed_w3">]</span> </h2>
			</div>
			</div>
			<br>
	<center>
	<table class="w3-table-all" align="center">
		<tr>
			<td width="400px"></td>
			<td class="w3-grey" width="100px"><p><b>제목</b></p></td>
			<td>
				<c:choose>
					<c:when test="${original.articleNum>0 }">
						<input type="text" name="title" size="50" value="Re: ${original.title }">					
					</c:when>
					<c:otherwise>
						<input type="text" name="title" size="50">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
		<td width="400px"></td>
			<td class="w3-grey"><p><b>내용</b></p></td>
			<td>
				<c:choose>
					<c:when test="${original.articleNum>0 }">
						<textarea rows="15" cols="50" name="contents">${original.contents }</textarea>					
					</c:when>
					<c:otherwise>
						<textarea rows="15" cols="50" name="contents" placeholder="여기에 내용을 입력하세요"></textarea>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 		<td width="250px"></td> -->
<!-- 			<td colspan="2"> -->
<!-- 				<input type="submit" value="작성완료"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>
	<br>
	<input type="submit" value="작성완료">
	</center>
	<br>
	</form>
<br>
<%@include file="footer.jsp"%>
</body>
</html>