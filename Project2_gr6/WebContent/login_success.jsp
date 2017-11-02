<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 완료 페이지</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<hr color="#6B9900">

	<center>
		<p align="center">
			<img src="home.png">
		</p>
	</center>
	<center>
		<font size="5" color="gray"><b>${sessionScope.loginId }님
				반갑습니다.</b></font><br>
		<hr color="#6B9900">
	</center>

	<center>
		<a href="${pageContext.request.contextPath }/index?task=home"><button>홈페이지 입장</button></a>
	</center>
<pre>
	
	
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>