<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ϱ� �Ϸ�</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<center>
	<h2>�����ϱⰡ �Ϸ�Ǿ����ϴ�</h2>
	<a href="${pageContext.request.contextPath }/board?task=boardList">
		[�Խ��� �������]
	</a>
	<a href="${pageContext.request.contextPath }/board?task=read&articleNum=${articleNum}">
		[������ �� ����]
	</a>
	</center>
<pre>
	
	
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>