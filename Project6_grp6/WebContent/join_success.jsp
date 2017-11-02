<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>

<title>회원가입 완료</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<hr color="#6B9900">
<c:set var="myContextPath" 
			value="${pageContext.request.contextPath}"/>
<center>
	<p align="center"><img src = "handShake.png"></p>
</center>
<center>
		<font size ="5" color="gray"><b>회원가입을 축하합니다</b></font>
		<br>
		<b>로그인을 시도하세요</b>
	</center>
	<hr color="#6B9900">
</center>
<center>
	<a href="${myContextPath}/member?task=loginForm">
		<input type="submit" value="로그인하러 가기">
	</a>
</center>
<pre>
	
	
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>