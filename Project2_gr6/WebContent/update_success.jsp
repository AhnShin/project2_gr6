<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정하기 완료</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<center>
	<h2>수정하기가 완료되었습니다</h2>
	<a href="${pageContext.request.contextPath }/board?task=boardList">
		[게시판 목록으로]
	</a>
	<a href="${pageContext.request.contextPath }/board?task=read&articleNum=${articleNum}">
		[수정한 글 보기]
	</a>
	</center>
<pre>
	
	
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>