<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 실패</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<hr color="#F15F5F">
	<p align="center">
		<img src="exclamation_red.png">
	</p>
	<center>
		<font size="5" color="gray"><b>로그인에 실패하였습니다.</b></font> <br> <b>아이디와
			패스워드를 다시 확인해주세요</b>
	</center>
	<hr color="#F15F5F">
	<center>
		<a href="${pageContext.request.contextPath }/member?task=loginForm">
			<button>로그인하러가기</button></a>
	</center>
	<pre>
	
	
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>